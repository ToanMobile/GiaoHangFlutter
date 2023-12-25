import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';

import '../../../../res/theme/theme_service.dart';
import '../../../base/base_page.dart';
import '../../../widgets/default_appbar.dart';
import '../widget/settings_item_view.dart';
import 'security_controller.dart';

//ignore: must_be_immutable
class SecurityLinkPage extends BasePage<SecurityController> {
  @override
  Widget buildContentView(BuildContext context, SecurityController controller) {
    return Scaffold(
      appBar: DefaultAppbar(title: textLocalization('setting.security.link'), appBarStyle: AppBarStyle.BACK),
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
          AccountItemView(
            icon: Assets.icons.icFb.image(width: 27.ws),
            title: textLocalization('setting.security.link.fb'),
            titleRight: textLocalization('setting.security.link.connect'),
            isIconNext: false,
            isActionTitleRight: true,
            onPressed: () {
              showMessage(textLocalization('feature'));
            },
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),
          AccountItemView(
            icon: Assets.icons.icGoogle.svg(width: 27.ws),
            title: textLocalization('setting.security.link.google'),
            titleRight: textLocalization('setting.security.link.noconnect'),
            isIconNext: false,
            isActionTitleRight: true,
            onPressed: () {
              showMessage(textLocalization('feature'));
            },
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),
          AccountItemView(
            icon: Assets.icons.icZalo.svg(width: 27.ws),
            title: textLocalization('setting.security.link.zalo'),
            titleRight: textLocalization('setting.security.link.noconnect'),
            isIconNext: false,
            isActionTitleRight: true,
            onPressed: () {
              showMessage(textLocalization('feature'));
            },
          ),
        ],
      ),
    );
  }
}
