import 'package:app_giao_hang/data/api/models/response/order/order_detail_model.dart';
import 'package:get/get.dart';

import '../../storage/my_storage.dart';
import '../api_constants.dart';
import '../models/response/auth/auth_res.dart';
import '../models/response/order/list_order_model.dart';
import 'base_service.dart';

class OrderService extends BaseService {
  final _storage = Get.find<MyStorage>();

  Future<AuthRes?> tokenModel() async => await _storage.getDeviceToken();

  Future<List<ListOrderModel>?> getListOrder() async {
    final response = await get(GET_LIST_ORDER_DELIVERY);
    if (response.data != null) {
      return List<ListOrderModel>.from(response.data.map((item) => ListOrderModel.fromJson(item)));
    } else {
      return null;
    }
  }

  Future<List<OrderDetail>?> getListOrderDetail(String id) async {
    final params = {"id": id};
    final response = await get(GET_DETAIL_ORDER, params: params);
    if (response.data != null) {
      return List<OrderDetail>.from(response.data.map((item) => OrderDetail.fromJson(item)));
    } else {
      return null;
    }
  }

/*
  Future<String> getNameFarm(List<FarmItem>? listFarm) async {
    final token = await tokenModel();
    final farm = listFarm?.firstWhere((element) => element.fkey == token?.fk);
    return Future.value(farm?.name ?? textLocalization('service.manager.my'));
  }

  Future<FarmItem?> getFarmDetail(String? fk) async {
    final token = await tokenModel();
    final params = {"uk": token?.uk, "fk": fk ?? token?.fk};
    final response = await post(GET_FARM, data: params);
    if (response.data != null) {
      return FarmItem.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<ApiResponse> createFarm({required String name, required String acreage, required String unit, required String address}) async {
    final token = await tokenModel();
    final params = {"uk": token?.uk, "name": name, "acreage": acreage, "unit": unit, "address": address};
    return await post(CREATE_FARM, data: params);
  }

  Future<ApiResponse> updateFarm({required String fk, required String name, required String acreage, required String unit, required String address}) async {
    final token = await tokenModel();
    final params = {"uk": token?.uk, "fk": fk, "name": name, "acreage": acreage, "unit": unit, "address": address};
    return await post(UPDATE_FARM, data: params);
  }

  Future<List<ProvinceItem>?> getListProvince() async {
    final token = await tokenModel();
    final params = {"uk": token?.uk, "fk": token?.fk};
    final response = await post(REGION_PROVINCE, data: params);
    if (response.data != null) {
      return List<ProvinceItem>.from(response.data.map((item) => ProvinceItem.fromJson(item)));
    } else {
      return null;
    }
  }

  Future<List<ProvinceItem>?> getListDistrict(String code) async {
    final token = await tokenModel();
    final params = {"uk": token?.uk, "fk": token?.fk, "code": code};
    final response = await post(REGION_DISTRICT, data: params);
    if (response.data != null) {
      return List<ProvinceItem>.from(response.data.map((item) => ProvinceItem.fromJson(item)));
    } else {
      return null;
    }
  }

  Future<List<ProvinceItem>?> getListWard(String code) async {
    final token = await tokenModel();
    final params = {"uk": token?.uk, "fk": token?.fk, "code": code};
    final response = await post(REGION_WARD, data: params);
    if (response.data != null) {
      return List<ProvinceItem>.from(response.data.map((item) => ProvinceItem.fromJson(item)));
    } else {
      return null;
    }
  }*/
}
