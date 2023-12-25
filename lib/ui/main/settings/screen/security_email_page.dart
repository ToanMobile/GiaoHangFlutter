import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';

import '../../../../res/theme/theme_service.dart';
import '../../../base/base_page.dart';
import '../../../widgets/button/custom_button.dart';
import '../../../widgets/default_appbar.dart';
import '../../../widgets/input/text_form_field_widget.dart';
import 'security_controller.dart';

//ignore: must_be_immutable
class SecurityEmailPage extends BasePage<SecurityController> {
  @override
  Widget buildContentView(BuildContext context, SecurityController controller) {
    return Scaffold(
      appBar: DefaultAppbar(title: textLocalization('setting.security.email.title'), appBarStyle: AppBarStyle.BACK),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSettingsSecurity(context),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsSecurity(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.ws),
      color: getColor().themeColorWhite,
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            ClearTextField(
              prefixIcon: Assets.icons.icEmail.svg(),
              hint: textLocalization("login.email"),
              keyboardType: TextInputType.emailAddress,
              controller: controller.textEmailCl,
              /*onValidated: (val) {
                return controller.validatorEmail(textLocalization("login.email"));
              },*/
            ),
            Divider(height: 1, thickness: 0.5, color: color929394),
            SizedBox(height: 16.hs),
            CustomButton(
              text: textLocalization('dialog.next').toUpperCase(),
              onPressed: () {
                controller.changeEmail((error) {
                  showMessage(error);
                });
              },
              isEnable: controller.buttonEnable.value,
              width: double.infinity,
              textStyle: text16.bold.textColorWhite,
              height: 42.ws,
              radius: 5.rs,
            ),
            SizedBox(height: 16.hs),
          ],
        ),
      ),
    );
  }
}
