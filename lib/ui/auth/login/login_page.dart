import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/widgets/button/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/base_page.dart';
import '../../widgets/base_scaffold_widget.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/container_widget.dart';
import '../../widgets/input/text_form_field_widget.dart';
import 'login_controller.dart';

//ignore: must_be_immutable
class LoginPage extends BasePage<LoginController> {
  @override
  Widget buildContentView(BuildContext context, LoginController controller) {
    initToast(Get.context!);
    return ScaffoldBase(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.ws),
              Assets.images.imgLogo.image(width: 100.ws, height: 100.ws),
              SizedBox(height: 10.ws),
              Text(textLocalization('appName').toUpperCase(), style: text26.bold.textColorPrimary),
              SizedBox(height: 40.ws),
              buildEditTextLogin(),
              SizedBox(height: 20.ws),
              CustomButton(
                text: textLocalization('login.title').toUpperCase(),
                onPressed: () {
                  controller.loginEmail((error) {
                    showMessage(error);
                  });
                },
                isEnable: controller.buttonEnable.value,
                width: double.infinity,
                textStyle: text16.bold.textColorWhite,
                height: 42.ws,
                radius: 5.rs,
              ),
              SizedBox(height: 20.ws),
              Text(textLocalization('login.des'), style: text14, textAlign: TextAlign.center),
              SizedBox(height: 34.ws),
              TouchableOpacity(
                child: Text(textLocalization('login.create_email'), style: text16.medium.height19Per.textColorPrimary),
                onPressed: controller.register,
              ),
              SizedBox(height: 15.ws),
              buildSocialLogin()
            ],
          ),
        ),
      ),
    );
  }

  buildEditTextLogin() => Column(
        children: [
          ClearTextField(
            prefixIcon: Assets.icons.icEmail.svg(color: colorPrimary),
            hint: textLocalization("login.email"),
            keyboardType: TextInputType.emailAddress,
            controller: controller.textEmailCl,
            onValidated: (val) {
              return controller.validatorEmail(textLocalization("login.email"));
            },
          ),
          ClearTextField(
            prefixIcon: Assets.icons.icLock.svg(color: colorPrimary),
            hint: textLocalization("login.password"),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            controller: controller.textPasswordCl,
            onValidated: (val) {
              return controller.requiredField(textLocalization("login.password"));
            },
          )
        ],
      );

  buildSocialLogin() => Column(
        children: [
          TouchableOpacity(
            onPressed: () => controller.loginFacebook((error) => null),
            child: ContainerBase(
              color: colorD3D3D4,
              child: Stack(
                children: [
                  Positioned(top: 0, bottom: 0, left: 30.ws, child: Assets.icons.icFb.image(width: 27.ws)),
                  Positioned.fill(
                    child: Center(
                      child: Text(textLocalization("login.facebook"), style: text14.medium.height16Per.textColor777777),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.ws),
          TouchableOpacity(
            onPressed: () => controller.loginGoogle((error) => null),
            child: ContainerBase(
              color: colorD3D3D4,
              child: Stack(
                children: [
                  Positioned(top: 0, bottom: 0, left: 30.ws, child: Assets.icons.icGoogle.svg()),
                  Positioned.fill(
                    child: Center(
                      child: Text(textLocalization("login.google"), style: text14.medium.height16Per.textColor777777),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.ws),
          Visibility(
            visible: false,
            child: TouchableOpacity(
              onPressed: () {
                showMessage(textLocalization('feature'));
              }, //=> controller.loginZalo((error) => null),
              child: ContainerBase(
                child: Stack(
                  children: [
                    Positioned(top: 0, bottom: 0, left: 30.ws, child: Assets.icons.icZalo.svg()),
                    Positioned.fill(
                      child: Center(
                        child: Text(textLocalization("login.zalo"), style: text14.medium.height16Per.textColor777777),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
