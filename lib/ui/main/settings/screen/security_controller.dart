import 'package:app_giao_hang/data/api/models/TUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_controller.dart';
import '../../../../app/app_pages.dart';
import '../../../../res/style.dart';
import '../../../base/base_controller.dart';

class SecurityController extends BaseController {
  final user = Get.find<AppController>().user ?? TUser();
  final textEmailCl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool buttonEnable = false.obs;
  bool get validate => GetUtils.isEmail(textEmailCl.text);

  @override
  void onInit() {
    super.onInit();
    textEmailCl.addListener(_controllerListener);
  }

  void _controllerListener() {
    formKey.currentState?.validate();
    buttonEnable.value = validate;
  }

  String? validatorEmail(String fieldName) {
    return GetUtils.isNullOrBlank(textEmailCl.text) == true || !GetUtils.isEmail(textEmailCl.text)
        ? 'sign_up_msg_is_required'.trParams({
            'field': fieldName,
          })
        : null;
  }

  changeEmail(Function(String) errorMessage) async {
    if (validatorEmail(textLocalization("login.email")) != null) {
      errorMessage(validatorEmail(textLocalization("login.email")) ?? '');
      return;
    }
    if (textEmailCl.text == "error@gmail.com") {
      errorMessage(textLocalization('login.error'));
      return;
    }
    showLoading();
    Future.delayed(Duration(seconds: 1), () async {
      try {
        buttonEnable.value = false;
        //await _userRespository.loginByPhone(""); //TODO
        hideLoading();
        buttonEnable.value = true;
        //Get.toNamed(AppRoutes.OTP_REGISTER, arguments: [textEmailCl.text, OtpType.reset_password]);
      } catch (e) {
        buttonEnable.value = true;
        hideLoading();
        errorMessage(getErrors(e));
      }
    });
  }

  onGotoEmail() {
    Get.toNamed(AppRoutes.SECURITY_EMAIL);
  }

  onGotoLink() {
    Get.toNamed(AppRoutes.SECURITY_LINK);
  }

  @override
  void dispose() {
    textEmailCl.removeListener(_controllerListener);
    textEmailCl.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }
}
