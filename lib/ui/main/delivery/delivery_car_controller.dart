import 'package:app_giao_hang/data/api/models/response/delivery/car_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_controller.dart';
import '../../../data/api/repositories/delivery_repository.dart';
import '../../base/base_controller.dart';

class DeliveryCarController extends BaseController {
  final _deliveryRepository = Get.find<DeliveryRepository>();
  final _appController = Get.find<AppController>();

  List<CarModel> get listData => _listData$.value;
  final _listData$ = <CarModel>[].obs;
  TextEditingController textName = TextEditingController();
  TextEditingController textPlate = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    getListDeliveryCar();
  }

  getListDeliveryCar() async {
    showLoading();
    try {
      _listData$.value = await _deliveryRepository.getListDeliveryCar() ?? List.empty();
      print('getListDelivery::' + listData.length.toString());
      hideLoading();
    } catch (e) {
      hideLoading();
    }
  }

  showDetail(CarModel item) {
    textName.text = item.vehiclename ?? '';
    textPlate.text = item.licenseplate ?? '';
  }

  @override
  void dispose() {
    textName.dispose();
    textPlate.dispose();
    super.dispose();
  }
}
