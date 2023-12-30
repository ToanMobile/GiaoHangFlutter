import 'package:app_giao_hang/data/api/models/TUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_controller.dart';
import '../../../app/app_pages.dart';
import '../../../data/api/repositories/user_repository.dart';
import '../../../data/storage/key_constant.dart';
import '../../../data/storage/my_storage.dart';
import '../../base/base_controller.dart';

class SettingsController extends BaseController {
  final appController = Get.find<AppController>();
  final _useRepository = Get.find<UserRepository>();
  final storage = Get.find<MyStorage>();
  final txtNameController = TextEditingController();
  final txtPhoneController = TextEditingController();
  final sexType = SEX_TYPE.MEN.obs;
  var _user = TUser().obs;
  var appVersion = ''.obs;

  TUser get user => _user.value;
  DateTime? dateTime;

  @override
  void onInit() async {
    super.onInit();
    try {
      //await _useRepository.getUserInfo();
    } catch (e) {}
    _user.value = appController.user ?? TUser(name: '', gender: SEX_TYPE.MEN.name, phone: '');
    if (user.gender == null) {
      _user.update((_user) {
        user.copyWith(gender: SEX_TYPE.MEN.name);
      });
    }
    dateTime = user.birthday ?? DateTime.parse(INIT_DATETIME);
    sexType.value = user.gender == 0 ? SEX_TYPE.MEN : (user.gender == 1 ? SEX_TYPE.WOMAN : SEX_TYPE.OTHER);
    txtNameController.text = user.name ?? '';
    txtPhoneController.text = user.phone ?? '';
  }

  void updateProfile(Function(String) errorMessage, {String? userName, DateTime? birthday, SEX_TYPE? sexType, String? phone}) async {
    showLoading();
    try {
      if (userName != null) {
        try {
          //await _useRepository.updateProfile(name: userName);
          _user.update((_user) {
            user.copyWith(name: userName);
          });
          txtNameController.text = userName;
        } catch (e) {
          txtNameController.text = user.name ?? '';
          errorMessage(getErrors(e));
        }
      }
      if (birthday != null) {
        try {
          //await _useRepository.updateProfile(birthday: birthday);
          dateTime = birthday;
          _user.update((_user) {
            user.copyWith(birthday: birthday);
          });
        } catch (e) {
          dateTime = user.birthday ?? DateTime.parse(INIT_DATETIME);
          errorMessage(getErrors(e));
        }
      }
      if (sexType != null) {
        try {
          Get.back();
          var gender = SEX_TYPE.MEN.name;
          switch (sexType) {
            case SEX_TYPE.MEN:
              gender = SEX_TYPE.MEN.name;
            case SEX_TYPE.WOMAN:
              gender = SEX_TYPE.WOMAN.name;
            case SEX_TYPE.OTHER:
              gender = SEX_TYPE.OTHER.name;
          }
          //await _useRepository.updateProfile(gender: gender);
          this.sexType.value = sexType;
          _user.update((_user) {
            user.copyWith(gender: gender);
          });
        } catch (e) {
          this.sexType.value = user.gender == 0 ? SEX_TYPE.MEN : (user.gender == 1 ? SEX_TYPE.WOMAN : SEX_TYPE.OTHER);
          errorMessage(getErrors(e));
        }
      }
      if (phone != null) {
        try {
          //await _useRepository.updateProfile(phone: phone);
          _user.update((_user) {
            user.copyWith(phone: phone);
          });
          txtPhoneController.text = phone;
        } catch (e) {
          txtPhoneController.text = user.phone ?? '';
          errorMessage(getErrors(e));
        }
      }
      print('_user:::${txtNameController.text}');
      storage.saveUserInfo(user);
      hideLoading();
    } catch (e) {
      print("errorMessage::" + getErrors(e));
      hideLoading();
      errorMessage(getErrors(e));
    }
  }

  onGotoNotificationsPage() {
    Get.toNamed(AppRoutes.LIST_NOTIFICATION);
  }

  onGotoSecurityPage() {}

  onGotoNotificationsSettingPage() {}
}
