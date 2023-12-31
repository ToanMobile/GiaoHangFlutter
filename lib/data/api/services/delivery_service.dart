import 'dart:convert';

import 'package:app_giao_hang/data/api/models/request/delivery/delivery_car_request_model.dart';
import 'package:app_giao_hang/data/api/models/response/delivery/car_model.dart';
import 'package:get/get.dart';

import '../../storage/my_storage.dart';
import '../api_constants.dart';
import '../models/request/delivery/delivery_user_request_model.dart';
import '../models/response/auth/auth_res.dart';
import '../models/response/delivery/delivery_model.dart';
import 'base_service.dart';

class DeliveryService extends BaseService {
  final _storage = Get.find<MyStorage>();

  Future<AuthRes?> tokenModel() async => await _storage.getDeviceToken();

  Future<List<DeliveryModel>?> getListDeliveryPerson() async {
    final response = await get(GET_LIST_DELIVERY_PER);
    if (response.data != null) {
      return List<DeliveryModel>.from(response.data.map((item) => DeliveryModel.fromJson(item)));
    } else {
      return null;
    }
  }

  Future<List<CarModel>?> getListDeliveryCar() async {
    final response = await get(GET_LIST_DELIVERY_CAR);
    if (response.data != null) {
      return List<CarModel>.from(response.data.map((item) => CarModel.fromJson(item)));
    } else {
      return null;
    }
  }

  Future<bool> updatePerson(DeliveryUserRequestModel userRequestModel) async {
    final response = await put(UPDATE_DELIVERY_PER, data: '[${jsonEncode(userRequestModel.toJson())}]');
    return response.result ?? false;
  }

  Future<bool> addPerson(DeliveryUserRequestModel userRequestModel) async {
    final response = await post(ADD_DELIVERY_PER, data: '[${jsonEncode(userRequestModel.toJson())}]');
    return response.result ?? false;
  }

  Future<bool> updateCar(DeliveryCarRequestModel carRequestModel) async {
    final response = await put(UPDATE_DELIVERY_CAR, data: '[${jsonEncode(carRequestModel.toJson())}]');
    return response.result ?? false;
  }

  Future<bool> addCar(DeliveryCarRequestModel carRequestModel) async {
    final response = await post(ADD_DELIVERY_CAR, data: '[${jsonEncode(carRequestModel.toJson())}]');
    return response.result ?? false;
  }
/*
  Future<DeviceDetailItem?> getDeviceDetail({required String sn}) async {
    final token = await tokenModel();
    final params = {"uk": token?.uk, "fk": token?.fk, "sn": sn};
    final response = await post(GET_DEVICE, data: params);
    if (response.data != null) {
      return DeviceDetailItem.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<List<DeviceItem>?> getListDevice(String? fk) async {
    final token = await tokenModel();
    final params = {"uk": token?.uk, "fk": fk ?? token?.fk};
    final response = await post(GET_ALL_DEVICE, data: params);
    if (response.data != null) {
      return List<DeviceItem>.from(response.data.map((item) => DeviceItem.fromJson(item)));
    } else {
      return null;
    }
  }

  Future<DeviceItemNew?> pairDevice({required String wifi, required String pass}) async {
    final token = await tokenModel();
    final params = <String, String>{"ukey": token?.uk ?? "", "fkey": token?.fk ?? "", "wifi": wifi, "pass": pass};
    final response = await getWithCustomUrlPost("URL_PAIR", PAIR_DEVICE, data: params);
    return DeviceItemNew.fromJson(response);
  }

  Future<bool> verifyDevice({required String sn, required String code}) async {
    try {
      final token = await tokenModel();
      final params = {"uk": token?.uk, "fk": token?.fk, "sn": sn, "code": code};
      final response = await post(VERIFY_DEVICE, data: params);
      if (response.code == 0 && (response.message == "Vui lòng kết nối thiết bị trước." || response.message == "Thiết bị chưa kết nối. Vui lòng chờ.")) {
        return Future.value(false);
      } else {
        return Future.value(true);
      }
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<DevicePush?> pushDevice({required String sn}) async {
    final token = await tokenModel();
    final params = {"uk": token?.uk, "fk": token?.fk, "sn": sn};
    final response = await post(PUSH_DEVICE, data: params);
    if (response.data != null) {
      return DevicePush.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<ApiResponse> deleteDevice({required String sn}) async {
    final token = await tokenModel();
    final params = {"uk": token?.uk, "fk": token?.fk, "sn": sn};
    return await post(DELETE_DEVICE, data: params);
  }



  Future<List<ChartDevice>?> getChart({required String sn, required String startTime, required String endTime}) async {
    Stopwatch stopwatch = Stopwatch()..start();
    final token = await tokenModel();
    final params = {"uk": token?.uk, "fk": token?.fk, "sn": sn, "f": startTime, "t": endTime};
    final response = await post(CHART_DEVICE, data: params);
    stopwatch.stop();
    print('getChart:::${stopwatch.elapsed}');
    if (response.data != null) {
      return List<ChartDevice>.from(response.data.map((item) => ChartDevice.fromJson(item)));
    } else {
      return List.empty();
    }
  }

  Future<List<ChartDevice>?> getChartLite(String sn) async {
    Stopwatch stopwatch = Stopwatch()..start();
    final token = await tokenModel();
    final params = {"uk": token?.uk, "fk": token?.fk, "sn": sn};
    final response = await post(CHART_DEVICE, data: params);
    stopwatch.stop();
    print('getChart:::${stopwatch.elapsed}');
    if (response.data != null) {
      return List<ChartDevice>.from(response.data.map((item) => ChartDevice.fromJson(item)));
    } else {
      return List.empty();
    }
  }*/
}
