import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_controller.dart';
import '../../../data/api/repositories/delivery_repository.dart';
import '../../base/base_controller.dart';

class DeliveryController extends BaseController  with GetSingleTickerProviderStateMixin {
  final _deliveryRepository = Get.find<DeliveryRepository>();
  final _appController = Get.find<AppController>();
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Quản lý nhân viên'.toUpperCase()),
    Tab(text: 'Quản lý phương tiện'.toUpperCase()),
  ];

  late TabController controller;

  @override
  void onInit() async {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
