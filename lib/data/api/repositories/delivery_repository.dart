import 'package:app_giao_hang/data/api/models/response/delivery/car_model.dart';
import 'package:get/get.dart';

import '../models/request/delivery/delivery_user_request_model.dart';
import '../models/response/delivery/delivery_model.dart';
import '../services/delivery_service.dart';
import 'base_repository.dart';

class DeliveryRepository extends BaseRepository {
  final _deliveryService = Get.find<DeliveryService>();

  Future<List<DeliveryModel>?> getListDeliveryPerson() async => _deliveryService.getListDeliveryPerson();

  Future<List<CarModel>?> getListDeliveryCar() async => _deliveryService.getListDeliveryCar();

  Future<bool> updatePerson(DeliveryUserRequestModel userRequestModel) async => _deliveryService.updatePerson(userRequestModel);

/* Future<DeviceDetailItem?> getDeviceDetail({required String sn}) async {
    final device = await _deviceService.getDeviceDetail(sn: sn);
    return device;
  }

  Future<DeviceItemNew?> pairDevice({required String wifi, required String password}) async {
    final data = await _deviceService.pairDevice(wifi: wifi, pass: password);
    print('pairDevice:::' + data.toString());
    return data;
  }

  Future<bool> verifyDevice({required String? sn, required String? code}) async {
    final data = await _deviceService.verifyDevice(sn: sn ?? "", code: code ?? "");
    return Future.value(data);
  }

  Future<List<DeviceItem>?> getListDevice(String? fk) async => _deviceService.getListDevice(fk);

  Future<ApiResponse> updateDevice({required String sn, required String name}) async {
    return await _deviceService.updateDevice(sn: sn, name: name);
  }

  Future<DevicePush?> pushDevice({required String sn}) async {
    return await _deviceService.pushDevice(sn: sn);
  }

  Future<ApiResponse> deleteDevice({required String sn}) async {
    return await _deviceService.deleteDevice(sn: sn);
  }

  Future<List<ChartDevice>?> getChartDevice({required String sn, required String startTime, required String endTime}) async => _deviceService.getChart(
        sn: sn,
        startTime: startTime,
        endTime: endTime,
      );

  Future<List<ChartDevice>?> getChartLite(String sn) async => _deviceService.getChartLite(sn);*/
}
