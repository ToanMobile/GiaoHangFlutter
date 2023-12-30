import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_controller.dart';
import '../../../data/api/repositories/user_repository.dart';
import '../../base/base_controller.dart';

class UpdateProfileController extends BaseController {
  final _userRespository = Get.find<UserRepository>();
  final nameController = TextEditingController();
  RxBool isEnable = false.obs;
  final profile = Get.find<AppController>().user!.copyWith();

  onUpdateProfile() {}

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(() {
      validateData();
    });
  }

  validateData() {
    if (nameController.text.isNotEmpty) {
      isEnable.value = true;
    } else {
      isEnable.value = false;
    }
  }

  Future<void> updateProfile() async {
    profile.copyWith(name: nameController.text, birthday: DateTime.now(), gender: 0, phone: "");
    try {
      showLoading();
      //await _userRespository.updateProfile();
      hideLoading();
    } catch (e) {
      showErrors(e);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
