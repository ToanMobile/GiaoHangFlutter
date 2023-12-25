import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';

import '../../../../res/theme/theme_service.dart';
import '../../../base/base_page.dart';
import '../../../widgets/default_appbar.dart';
import '../widget/notification_item_view.dart';
import 'security_controller.dart';

//ignore: must_be_immutable
class SettingNotificationPage extends BasePage<SecurityController> {
  @override
  Widget buildContentView(BuildContext context, SecurityController controller) {
    return Scaffold(
      appBar: DefaultAppbar(title: textLocalization('settings_noti'), appBarStyle: AppBarStyle.BACK),
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
      padding: EdgeInsets.symmetric(horizontal: 24.ws),
      color: getColor().themeColorWhite,
      child: Column(
        children: [
          NotificationItemView(
            title: textLocalization('setting.noti.system'),
            onPressed: () {
              showMessage(textLocalization('feature'));
            },
            onSwitch: (value) {
              showMessage(value.toString());
            },
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),
          NotificationItemView(
            title: textLocalization('setting.noti.device'),
            onPressed: () {
              showMessage(textLocalization('feature'));
            },
            onSwitch: (value) {
              showMessage(value.toString());
            },
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),
          NotificationItemView(
            title: textLocalization('setting.noti.other'),
            onPressed: () {
              showMessage(textLocalization('feature'));
            },
            onSwitch: (value) {
              showMessage(value.toString());
            },
          ),
        ],
      ),
    );
  }
}
