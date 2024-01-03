import 'package:app_giao_hang/data/api/models/request/delivery/delivery_user_request_model.dart';
import 'package:app_giao_hang/data/api/models/response/delivery/delivery_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_controller.dart';
import '../../../data/api/repositories/delivery_repository.dart';
import '../../base/base_controller.dart';

enum GenderType { MEN, WOMEN }

class DeliveryPersonController extends BaseController {
  final _deliveryRepository = Get.find<DeliveryRepository>();
  final _appController = Get.find<AppController>();

  List<DeliveryModel> get listData => _listData$.value;
  final _listData$ = <DeliveryModel>[].obs;

  TextEditingController textName = TextEditingController();
  TextEditingController textEmail = TextEditingController();
  TextEditingController textSdt = TextEditingController();
  TextEditingController textAddress = TextEditingController();
  TextEditingController textCCCD = TextEditingController();
  TextEditingController textSex = TextEditingController();
  final genderType = GenderType.MEN.obs;

  int get getGender => genderType == GenderType.MEN ? 1 : 0;

  @override
  void onInit() async {
    super.onInit();
    getListDeliveryPerson();
  }

  getListDeliveryPerson() async {
    showLoading();
    try {
      _listData$.value = await _deliveryRepository.getListDeliveryPerson() ?? List.empty();
      print('getListDelivery::' + listData.length.toString());
      hideLoading();
    } catch (e) {
      hideLoading();
    }
  }

  clearDetail() {
    textName.clear();
    textEmail.clear();
    textSdt.clear();
    textAddress.clear();
    textCCCD.clear();
    textSex.clear();
  }

  showDetail(DeliveryModel item) {
    textName.text = item.fullname ?? '';
    textEmail.text = item.email ?? '';
    textSdt.text = item.phone ?? '';
    textAddress.text = item.address ?? '';
    textCCCD.text = item.cccd ?? '';
    genderType.value = item.gender == 1 ? GenderType.MEN : GenderType.WOMEN;
    textSex.text = item.gender == 1 ? 'Nam' : 'Nữ';
  }

  updateGender(GenderType? genderUpdateType) {
    genderType.value = genderUpdateType ?? GenderType.MEN;
  }

  updatePerson(DeliveryModel item) async {
    showLoading();
    try {
      await _deliveryRepository.updatePerson(DeliveryUserRequestModel(
        id: item.id,
        phone: textSdt.text,
        email: textEmail.text,
        fullname: textName.text,
        address: textAddress.text,
        cccd: textCCCD.text,
        gender: getGender,
      ));
      await getListDeliveryPerson();
      print('getListDelivery::' + listData.length.toString());
      hideLoading();
    } catch (e) {
      hideLoading();
    }
  }

  addPerson() async {
    showLoading();
    try {
      await _deliveryRepository.addPerson(DeliveryUserRequestModel(
        id: 0,
        phone: textSdt.text,
        email: textEmail.text,
        fullname: textName.text,
        address: textAddress.text,
        cccd: textCCCD.text,
        gender: getGender,
      ));
      await getListDeliveryPerson();
      print('getListDelivery::' + listData.length.toString());
      hideLoading();
    } catch (e) {
      hideLoading();
    }
  }

  @override
  void dispose() {
    textName.dispose();
    textEmail.dispose();
    textSdt.dispose();
    textAddress.dispose();
    textCCCD.dispose();
    textSex.dispose();
    super.dispose();
  }
}
