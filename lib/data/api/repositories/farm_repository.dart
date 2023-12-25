import 'package:app_giao_hang/data/api/models/province/province_item.dart';
import 'package:get/get.dart';

import '../models/farm/farm_item.dart';
import '../models/response/api_response.dart';
import '../services/farm_service.dart';
import 'base_repository.dart';

class FarmRepository extends BaseRepository {
  final _farmService = Get.find<FarmService>();

  Future<FarmItem?> getFarmDetail(String? fk) async {
    final farm = await _farmService.getFarmDetail(fk);
    return farm;
  }

  Future<String> getNameFarm(List<FarmItem>? listFarm) async => _farmService.getNameFarm(listFarm);

  Future<List<FarmItem>?> getListFarm() async => _farmService.getListFarm();

  Future<ApiResponse> updateFarm({required String fk, required String name, required String acreage, required String unit, required String address}) async {
    return await _farmService.updateFarm(fk: fk, name: name, acreage: acreage, unit: unit, address: address);
  }

  Future<ApiResponse> createFarm({required String name, required String acreage, required String unit, required String address}) async {
    return await _farmService.createFarm(name: name, acreage: acreage, unit: unit, address: address);
  }

  Future<List<ProvinceItem>?> getListProvince() async => await _farmService.getListProvince();

  Future<List<ProvinceItem>?> getListDistrict(String code) async => await _farmService.getListDistrict(code);

  Future<List<ProvinceItem>?> getListWard(String code) async => await _farmService.getListWard(code);
}
