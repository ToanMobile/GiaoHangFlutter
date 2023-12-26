import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/api/repositories/device_repository.dart';
import '../../data/api/repositories/order_repository.dart';
import '../../ui/base/base_controller.dart';

class MainController extends BaseController {
  final _orderRepository = Get.find<OrderRepository>();
  final _deviceRepository = Get.find<DeviceRepository>();
  late PageController pageController;
  RxInt pageIndex = 0.obs;

  MainController() {
    pageController = PageController();
  }

  onTabChanged(int index) {
    pageController.jumpToPage(index);
    pageIndex.value = index;
  }

  onGotoAddFarm() {}

  onGotoListFarm() {}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
