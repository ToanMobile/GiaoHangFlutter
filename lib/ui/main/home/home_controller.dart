// ignore_for_file: invalid_use_of_protected_member

import 'package:app_giao_hang/data/api/repositories/device_repository.dart';
import 'package:app_giao_hang/data/storage/key_constant.dart';
import 'package:app_giao_hang/ui/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_controller.dart';
import '../../../data/api/models/TUser.dart';
import '../../base/base_controller.dart';

class HomeController extends BaseController {
  final _mainController = Get.find<MainController>();
  final _deviceRepository = Get.find<DeviceRepository>();
  final _appController = Get.find<AppController>();
  var _user = TUser().obs;

  TUser get user => _user.value;
  final GlobalKey widgetKey = GlobalKey();

  @override
  void onClose() {
    print('HomeController:onClose');
    super.onClose();
  }

  @override
  void onInit() async {
    super.onInit();
    _user.value = _appController.user ?? TUser(name: 'Văn Toàn', gender: SEX_TYPE.MEN.name, phone: '');
  }

  @override
  void dispose() {
    super.dispose();
  }
}
