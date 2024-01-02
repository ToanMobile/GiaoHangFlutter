import 'package:app_giao_hang/data/api/models/response/order/order_detail_model.dart';
import 'package:get/get.dart';

import '../models/response/order/list_order_model.dart';
import '../services/order_service.dart';
import 'base_repository.dart';

class OrderRepository extends BaseRepository {
  final _orderService = Get.find<OrderService>();

  Future<List<ListOrderModel>?> getListOrder() async => _orderService.getListOrder();

  Future<List<OrderDetail>?> getListOrderDetails(String id) async => _orderService.getListOrderDetail(id);

/*Future<FarmItem?> getFarmDetail(String? fk) async {
    final farm = await _farmService.getFarmDetail(fk);
    return farm;
  }

  Future<String> getNameFarm(List<FarmItem>? listFarm) async => _farmService.getNameFarm(listFarm);



  Future<ApiResponse> updateFarm({required String fk, required String name, required String acreage, required String unit, required String address}) async {
    return await _farmService.updateFarm(fk: fk, name: name, acreage: acreage, unit: unit, address: address);
  }

  Future<ApiResponse> createFarm({required String name, required String acreage, required String unit, required String address}) async {
    return await _farmService.createFarm(name: name, acreage: acreage, unit: unit, address: address);
  }

  Future<List<ProvinceItem>?> getListProvince() async => await _farmService.getListProvince();

  Future<List<ProvinceItem>?> getListDistrict(String code) async => await _farmService.getListDistrict(code);

  Future<List<ProvinceItem>?> getListWard(String code) async => await _farmService.getListWard(code);*/
}
