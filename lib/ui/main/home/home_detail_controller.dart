// ignore_for_file: invalid_use_of_protected_member

import 'package:app_giao_hang/data/api/repositories/order_repository.dart';
import 'package:app_giao_hang/data/storage/key_constant.dart';
import 'package:app_giao_hang/ui/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_controller.dart';
import '../../../data/api/models/TUser.dart';
import '../../../data/api/models/response/order/item_model.dart';
import '../../../data/api/models/response/order/order_detail_model.dart';
import '../../base/base_controller.dart';

class HomeDetailsController extends BaseController {
  final _mainController = Get.find<MainController>();
  final _orderRepository = Get.find<OrderRepository>();
  final _appController = Get.find<AppController>();
  var _user = TUser().obs;

  TUser get user => _user.value;
  final GlobalKey widgetKey = GlobalKey();

  final String? orderId = Get.arguments as String?;

  OrderDetail get orderDetail => _orderDetail$.value;
  final _orderDetail$ = OrderDetail().obs;

  List<SlotsModel> get listModel => _listModel$.value;
  final _listModel$ = <SlotsModel>[].obs;

  @override
  void onClose() {
    print('HomeController:onClose');
    super.onClose();
  }

  @override
  void onInit() async {
    super.onInit();
    _user.value = _appController.user ?? TUser(name: 'Văn Toàn', gender: SEX_TYPE.MEN.name, phone: '');
    getOrderDetail(orderId ?? '');
  }

  getOrderDetail(String id) async {
    showLoading();
    try {
      await _orderRepository.getListOrderDetails(id).then((value) {
        _orderDetail$.value = value?.first ?? OrderDetail();
        if (_orderDetail$.value.productorder?.first.model != null) {
          List<SlotsModel>? listSlot = [];
          final list = mModelFromJson(_orderDetail$.value.productorder?.first.model ?? '');
          list.forEach((e) {
            listSlot.addAll(e.slots?.toList() ?? []);
          });
          _listModel$.value = listSlot;
        }
      });
      hideLoading();
    } catch (e) {
      hideLoading();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
