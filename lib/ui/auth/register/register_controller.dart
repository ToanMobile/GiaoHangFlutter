import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_controller.dart';
import '../../../app/app_pages.dart';
import '../../../data/api/repositories/user_repository.dart';
import '../../base/base_controller.dart';
import '../../base/base_page.dart';

class RegisterController extends BaseController {
  final _userRepository = Get.find<UserRepository>();

  ViewState get initState => ViewState.loaded;
  final formKey = GlobalKey<FormState>();
  TextEditingController textUserNameCl = TextEditingController();
  TextEditingController textEmailCl = TextEditingController();
  RxBool buttonEnable = false.obs;

  @override
  int get typeViewNoti => 3;

  bool get validateEmail => GetUtils.isEmail(textEmailCl.text);

  bool get validateUserName => GetUtils.isLengthGreaterOrEqual(textUserNameCl.text, 3);

  @override
  void onInit() {
    super.onInit();
    textUserNameCl.addListener(_controllerListener);
    textEmailCl.addListener(_controllerListener);
  }

  void _controllerListener() {
    formKey.currentState?.validate();
    buttonEnable.value = validateEmail && validateUserName;
  }

  String? validatorEmail(String fieldName) {
    return GetUtils.isNullOrBlank(textEmailCl.text) == true || !GetUtils.isEmail(textEmailCl.text)
        ? 'sign_up_msg_is_required'.trParams({
            'field': fieldName,
          })
        : null;
  }

  String? validatorUserName(String fieldName) {
    return (GetUtils.isNullOrBlank(textUserNameCl.text) == true)
        ? 'sign_up_msg_is_required'.trParams(
            {
              'field': fieldName,
            },
          )
        : GetUtils.isLengthLessThan(textUserNameCl.text, 3)
            ? 'sign_up_msg_is_at_least_3_characters'.trParams(
                {
                  'field': fieldName,
                },
              )
            : null;
  }

  register(Function(String) errorMessage) async {
    if (validatorUserName(textLocalization("signup.user_name")) != null) {
      errorMessage(validatorUserName(textLocalization("signup.user_name")) ?? '');
      return;
    }
    if (validatorEmail(textLocalization("login.email")) != null) {
      errorMessage(validatorEmail(textLocalization("login.email")) ?? '');
      return;
    }
    if (textEmailCl.text == "error@gmail.com") {
      errorMessage(textLocalization('login.error'));
      return;
    }
    showLoading();
    try {
      //final response = await _userRepository.register(textUserNameCl.text, textEmailCl.text);
      //print("response::" + response.toString());
      hideLoading();
      await Get.find<AppController>().initAuth();
      Get.offAllNamed(AppRoutes.MAIN);
    } catch (e) {
      hideLoading();
      errorMessage(getErrors(e));
    }
  }

  login() async {
    Get.offNamed(AppRoutes.INITIAL);
  }

  @override
  void dispose() {
    textUserNameCl.removeListener(_controllerListener);
    textUserNameCl.dispose();
    textEmailCl.removeListener(_controllerListener);
    textEmailCl.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }
}
