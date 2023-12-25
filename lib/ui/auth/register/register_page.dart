import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/widgets/button/touchable_opacity.dart';
import 'package:flutter/material.dart';

import '../../base/base_page.dart';
import '../../widgets/base_scaffold_widget.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/container_widget.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/input/text_form_field_widget.dart';
import 'register_controller.dart';

//ignore: must_be_immutable
class RegisterPage extends BasePage<RegisterController> {
  @override
  Widget buildContentView(BuildContext context, RegisterController controller) {
    return ScaffoldBase(
      appBar: DefaultAppbar(title: textLocalization('signup.title'), appBarStyle: AppBarStyle.NONE),
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
              SizedBox(height: 50.ws),
              ContainerBase(
                height: 160.hs,
                isMargin: true,
                child: buildEditTextSignUp(),
              ),
              SizedBox(height: 20.ws),
              CustomButton(
                text: textLocalization('signup.title').toUpperCase(),
                onPressed: () {
                  controller.register((error) {
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
              Text(textLocalization('signup.des'), style: text14, textAlign: TextAlign.center),
              SizedBox(height: 34.ws),
              TouchableOpacity(
                child: Text(textLocalization('signup.login'), style: text16.medium.textColorPrimary),
                onPressed: controller.login,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildEditTextSignUp() => Column(
        children: [
          ClearTextField(
            prefixIcon: Assets.icons.icUser.svg(),
            hint: textLocalization("signup.user_name"),
            keyboardType: TextInputType.text,
            controller: controller.textUserNameCl,
            /*onValidated: (val) {
              return controller.validatorUserName(textLocalization("signup.user_name"));
            },*/
          ),
          ClearTextField(
            prefixIcon: Assets.icons.icEmail.svg(),
            hint: textLocalization("login.email"),
            keyboardType: TextInputType.emailAddress,
            controller: controller.textEmailCl,
            /*onValidated: (val) {
              return controller.validatorEmail(textLocalization("login.email"));
            },*/
          )
        ],
      );
}
