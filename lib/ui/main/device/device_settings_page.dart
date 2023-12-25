import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/widgets/button/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/theme/theme_service.dart';
import '../../base/base_page.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/dialogs/app_dialog.dart';
import '../../widgets/input/text_input_line_border.dart';
import '../settings/widget/settings_item_view.dart';
import 'device_controller.dart';

//ignore: must_be_immutable
class DeviceSettingsPage extends BasePage<DeviceController> {
  @override
  Widget buildContentView(BuildContext context, DeviceController controller) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: textLocalization('home.device.setting.title'),
        appBarStyle: AppBarStyle.BACK,
        onPress: () => Get.back(result: controller.nameDeviceController.text),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSettingsDevice(context),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsDevice(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.ws),
      color: getColor().themeColorWhite,
      child: Column(
        children: [
          AccountItemView(
            title: textLocalization('dialog.device.name'),
            titleRight: controller.nameDeviceController.text.isNotEmpty ? controller.nameDeviceController.text : textLocalization('home.device.setting.no.setting'),
            isIconNext: true,
            onPressed: () => buildOpenUserName(context),
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),
          /* AccountItemView(
            title: textLocalization('home.device.error.des2'),
            isIconNext: true,
            onPressed: () => Get.toNamed(AppRoutes.ADD_DEVICE),
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),*/
          TouchableOpacity(
            onPressed: () => buildRemoveDevice(context),
            child: Container(
              height: 52.hs,
              padding: EdgeInsets.symmetric(vertical: 12.hs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(textLocalization('home.device.setting.delete'), style: text14.bold.textColorF20606),
                  Assets.icons.icTrashFull.svg(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildOpenUserName(BuildContext context) => AppDialog(
      context: context,
      title: '',
      description: textLocalization('dialog.device.name'),
      type: DialogType.INPUT,
      cancelText: textLocalization('dialog.ignore'),
      okText: textLocalization('dialog.save'),
      input: TextInputLineBorder(
        width: double.infinity,
        hint: textLocalization('dialog.device.name'),
        hintTextStyle: text12.textColorB2B2B2,
        textTextStyle: text14.textColor141414,
        height: 36.hs,
        textEditingController: controller.nameDeviceController,
      ),
      onOkPressed: () => controller.updateDeviceName(controller.nameDeviceController.text)).show();

  buildRemoveDevice(BuildContext context) => AppDialog(
      context: context,
      title: textLocalization('dialog.device.remove'),
      description: textLocalization('dialog.device.remove.des'),
      type: DialogType.TEXT,
      cancelText: textLocalization('dialog.ignore'),
      okText: textLocalization('dialog.save'),
      onOkPressed: () {
        controller.removeDevice((error) {
          showMessage(error);
        });
      }).show();
}
