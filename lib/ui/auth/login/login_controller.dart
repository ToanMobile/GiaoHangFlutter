import 'package:app_giao_hang/res/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../app/app_controller.dart';
import '../../../app/app_pages.dart';
import '../../../data/api/repositories/user_repository.dart';
import '../../../data/storage/key_constant.dart';
import '../../base/base_controller.dart';
import '../../base/base_page.dart';

class LoginController extends BaseController {
  final _userRepository = Get.find<UserRepository>();

  ViewState get initState => ViewState.loaded;
  final formKey = GlobalKey<FormState>();
  TextEditingController textEmailCl = TextEditingController()..text = 'huynhvantoan.itc@gmail.com';
  TextEditingController textPasswordCl = TextEditingController()..text = '123456';
  RxBool buttonEnable = false.obs;

  @override
  int get typeViewNoti => 3;

  bool get validate => GetUtils.isEmail(textEmailCl.text) && GetUtils.isLengthGreaterOrEqual(textPasswordCl.text, 6);

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

  String? minimum6Characters() => textPasswordCl.text.length < 6 ? 'Tối thiểu 6 chữ số' : null;

  String? requiredField(String? value) {
    return value == null || value.isEmpty ? 'Không được để trống mật khẩu!' : null;
  }

  loginEmail(Function(String) errorMessage) async {
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
      //TODO TOAN
      //await _userRepository.loginByEmail(textEmailCl.text);
      hideLoading();
      await Get.find<AppController>().initAuth();
      Get.offAllNamed(AppRoutes.MAIN);
    } catch (e) {
      hideLoading();
      errorMessage(getErrors(e));
    }
  }

  loginGoogle(Function(String) errorMessage) async {
    showLoading();
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final response = await _googleSignIn.signIn();
      if (response != null) {
        print('loginGoogle::' + response.toString());
        await _userRepository.loginBySocial(
          response.email,
          SOCIAL_TYPE.GOOGLE.name,
          socialId: response.id,
          serverAuthCode: response.serverAuthCode,
          displayName: response.displayName,
          avatar: response.photoUrl,
        );
        hideLoading();
        await Get.find<AppController>().initAuth();
        Get.offAllNamed(AppRoutes.MAIN);
      } else {
        hideLoading();
        errorMessage(textLocalization('login.error'));
      }
    } catch (e) {
      print('loginGoogle:error:' + e.toString());
      hideLoading();
      errorMessage(getErrors(e));
    }
  }

  loginFacebook(Function(String) errorMessage) async {
    showLoading();
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
        UserCredential response = await FirebaseAuth.instance.signInWithCredential(credential);
        if (response.credential != null) {
          try {
            print('loginFacebook::' + response.toString());
            await _userRepository.loginBySocial(
              response.user?.email ?? response.additionalUserInfo?.profile?["email"],
              SOCIAL_TYPE.FACEBOOK.name,
              token: response.credential?.token.toString(),
              accessToken: response.credential?.accessToken,
              fullName: response.additionalUserInfo?.profile?["name"],
              socialId: response.additionalUserInfo?.profile?["id"],
              displayName: response.user?.displayName,
              avatar: response.user?.photoURL,
            );
            hideLoading();
            await Get.find<AppController>().initAuth();
            Get.offAllNamed(AppRoutes.MAIN);
          } catch (e) {
            hideLoading();
            errorMessage(getErrors(e));
          }
        } else {
          hideLoading();
          errorMessage(textLocalization('login.error'));
        }
      } else {
        hideLoading();
        print(result.status);
        print(result.message);
      }
    } catch (e) {
      print('loginGoogle:error:' + e.toString());
      hideLoading();
      errorMessage(getErrors(e));
    }
  }

  loginZalo(Function(String) errorMessage) async {
    showLoading();
    try {
      // ZaloLogin data = await ZaloFlutter.login();
      // hideLoading();
      // print('loginZalo:jsonEncode:' + jsonEncode(data.toJson()));
      // if (data.data != null) {
      //   await Get.find<AppController>().initAuth();
      //   print('loginZalo:data::' + data.data.toString());
      //   Get.toNamed(AppRoutes.OTP_REGISTER, arguments: [textEmailCl.text, OtpType.register]);
      // }
    } catch (e) {
      print('loginZalo:error:' + e.toString());
      hideLoading();
      errorMessage(getErrors(e));
    }
  }

  register() async {
    Get.offNamed(AppRoutes.REGISTER);
  }

  @override
  void dispose() {
    textEmailCl.removeListener(_controllerListener);
    textEmailCl.dispose();
    textPasswordCl.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }
}
