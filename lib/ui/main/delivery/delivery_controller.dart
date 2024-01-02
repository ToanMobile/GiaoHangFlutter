import 'package:app_giao_hang/data/api/models/response/delivery/delivery_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app/app_controller.dart';
import '../../../data/api/repositories/delivery_repository.dart';
import '../../base/base_controller.dart';

class DeliveryController extends BaseController {
  final _deliveryRepository = Get.find<DeliveryRepository>();
  final _appController = Get.find<AppController>();
  List<DeliveryModel> get listData => _listData$.value;
  final _listData$ = <DeliveryModel>[].obs;
  TextEditingController textName = TextEditingController();
  TextEditingController textEmail = TextEditingController();
  TextEditingController textSDt = TextEditingController();
  TextEditingController textAddress = TextEditingController();
  TextEditingController textCCCD = TextEditingController();
  TextEditingController textSex = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    getListDelivery();
  }

  setData(DeliveryModel item){
    textName.text = item.fullname ?? '';
    textEmail.text = item.email ?? '';
    textSDt.text = item.phone?? '';
    textAddress.text = item.address;
    textCCCD.text = item.cccd ?? '';
    textSex.text = item.gender == 0 ? 'Nam': 'Nữ';
  }
  getListDelivery() async {
    showLoading();
    try {
      _listData$.value = await _deliveryRepository.getListDelivery() ?? List.empty();
      print('getListDelivery::'+ listData.length.toString());
      hideLoading();
    } catch (e) {
      hideLoading();
    }
  }
}
