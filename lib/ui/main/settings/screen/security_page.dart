import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';

import '../../../../res/theme/theme_service.dart';
import '../../../base/base_page.dart';
import '../../../widgets/default_appbar.dart';
import '../widget/settings_item_view.dart';
import 'security_controller.dart';

//ignore: must_be_immutable
class SecurityPage extends BasePage<SecurityController> {
  @override
  Widget buildContentView(BuildContext context, SecurityController controller) {
    return Scaffold(
      appBar: DefaultAppbar(title: textLocalization('settings_account_security'), appBarStyle: AppBarStyle.BACK),
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
      child: Column(
        children: [
          AccountItemView(
            title: textLocalization('login.email'),
            titleRight: textLocalization('setting.security.email'),
            isIconNext: true,
            onPressed: () => controller.onGotoEmail(),
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),
          AccountItemView(
            title: textLocalization('setting.security.link'),
            isIconNext: true,
            onPressed: () => controller.onGotoLink(),
          ),
        ],
      ),
    );
  }
}
