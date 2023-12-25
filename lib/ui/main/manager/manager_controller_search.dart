import 'dart:async';

import 'package:app_giao_hang/app/app_pages.dart';
import 'package:app_giao_hang/data/api/models/province/province_item.dart';
import 'package:app_giao_hang/data/api/repositories/farm_repository.dart';
import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/main/manager/manager_controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as loc;

import '../../base/super_base_controller.dart';

class ManagerSearchController extends BaseSuperController {
  final _farmRepository = Get.find<FarmRepository>();
  TextEditingController tecSearch = TextEditingController();
  RxInt stepLocation = 0.obs;
  final managerController = Get.find<ManagerController>();

  //Address
  List<ProvinceItem> get listProvince => _listProvince$.value;
  final _listProvince$ = <ProvinceItem>[].obs;

  List<ProvinceItem> get listDistrict => _listDistrict$.value;
  final _listDistrict$ = <ProvinceItem>[].obs;

  List<ProvinceItem> get listWard => _listWard$.value;
  final _listWard$ = <ProvinceItem>[].obs;
  var pickProvince = ProvinceItem().obs;
  var pickDistrict = ProvinceItem().obs;
  var pickWard = ProvinceItem().obs;
  var isLocationNow = false;

  @override
  void onInit() {
    super.onInit();
    getListProvince();
  }

  Future<void> getListProvince() async {
    try {
      showLoading();
      await _farmRepository.getListProvince().then((value) {
        if (value != null) {
          _listProvince$.value = value;
          print("getListProvince:::" + _listProvince$.value.map((e) => e.toString()).toString());
        }
      });
      hideLoading();
    } catch (e) {
      showMessage(getErrors(e));
    }
  }

  Future<void> getListDistrict(String code) async {
    try {
      showLoading();
      await _farmRepository.getListDistrict(code).then((value) {
        if (value != null) {
          _listDistrict$.value = value;
          print("getListDistrict:::" + _listDistrict$.value.map((e) => e.toString()).toString());
        }
      });
      hideLoading();
    } catch (e) {
      showMessage(getErrors(e));
    }
  }

  Future<void> getListWard(String code) async {
    try {
      showLoading();
      await _farmRepository.getListWard(code).then((value) {
        if (value != null) {
          _listWard$.value = value;
          print("getListWard:::" + _listWard$.value.map((e) => e.toString()).toString());
        }
      });
      hideLoading();
    } catch (e) {
      showMessage(getErrors(e));
    }
  }

  Future<void> getAddressLocationNow() async {
    if (!isLocationNow) {
      isLocationNow = true;
    }
    getAddressLocation();
  }

  Future<void> getAddressLocation() async {
    try {
      showLoading();
      Position position = await _getGeoLocationPosition();
      GetAddressFromLatLong(position);
      print("getListWard:::" + _listWard$.value.map((e) => e.toString()).toString());
      hideLoading();
    } catch (e) {
      showMessage(e.toString());
    }
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    loc.Location location = loc.Location();
    if (!await location.serviceEnabled()) {
      isLocationNow = false;
    }
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      isLocationNow = false;
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      isLocationNow = false;
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      isLocationNow = false;
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placeMarks);
    Placemark? place0;
    Placemark? place1;
    if (placeMarks.length > 1) {
      place0 = placeMarks[0];
      place1 = placeMarks[1];
    } else if (placeMarks.length == 1) {
      place0 = placeMarks[0];
    }
    managerController.updateFarm(
      address: place1?.street,
      ward: place1?.subLocality?.isNotEmpty == true
          ? place1?.subLocality
          : place1?.locality?.isNotEmpty == true
              ? place1?.locality
              : place0?.street?.isNotEmpty == true && ((place0?.street?.length ?? 0) > 5)
                  ? 'P.${place0?.street}'
                  : '',
      province: place1?.administrativeArea,
      district: place1?.subAdministrativeArea,
    );
    print("current:::" + Get.routing.current.toString());
    print("previous:::" + Get.routing.previous.toString());
    if (Get.routing.current == AppRoutes.MANAGER_SEARCH_LOCATION && Get.routing.previous == AppRoutes.MANAGER) {
      Get.back();
    }
  }

  @override
  void dispose() {
    tecSearch.dispose();
    super.dispose();
  }

  void pickLocationAddress(ProvinceItem address) {
    stepLocation.value += 1;
    switch (stepLocation.value) {
      case 1:
        pickProvince.value = address;
        managerController.updateFarm(province: address.name);
        getListDistrict(address.code ?? "");
        break;
      case 2:
        pickDistrict.value = address;
        managerController.updateFarm(district: address.name);
        getListWard(address.code ?? "");
        break;
      case 3:
        pickWard.value = address;
        managerController.updateFarm(ward: address.name);
        Get.back();
        break;
    }
    print("pickLocationAddress:::" + stepLocation.value.toString());
  }

  String? get getDisplayAddress => "${pickProvince.value.name}, ${pickDistrict.value}, ${pickWard.value}";

  void resetLocation() {
    stepLocation.value = 0;
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {
    if (isLocationNow) {
      isLocationNow = false;
      getAddressLocation();
    }
  }

  @override
  void onHidden() {}
}
