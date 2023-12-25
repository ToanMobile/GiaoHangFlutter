import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';

import '../../../res/theme/theme_service.dart';
import '../../base/base_page.dart';
import '../../widgets/button/touchable_opacity.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/dialogs/app_dialog.dart';
import '../../widgets/input/text_input_line_border.dart';
import '../settings/widget/settings_item_view.dart';
import 'manager_controller.dart';

//ignore: must_be_immutable
class ManagerPage extends BasePage<ManagerController> {
  @override
  Widget buildContentView(BuildContext context, ManagerController controller) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: controller.farmItem != null ? textLocalization('service.manager.update.title') : textLocalization('service.manager.add.title'),
        appBarStyle: AppBarStyle.BACK,
        actions: [
          TouchableOpacity(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                controller.farmItem != null ? textLocalization('dialog.update') : textLocalization('dialog.save2'),
                style: text16.bold.textColorPrimary,
              ),
            ),
            onPressed: () {
              controller.addOrUpdateFarm(
                (error) {
                  showMessage(error);
                },
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.ws, vertical: 15.hs),
              child: Text(textLocalization('service.manager.info'), style: text14.textColorB2B2B2),
            ),
            buildManagerSize(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.ws, vertical: 15.hs),
              child: Text(textLocalization('service.manager.address'), style: text14.textColorB2B2B2),
            ),
            buildManagerLocation(context),
          ],
        ),
      ),
    );
  }

  Widget buildManagerSize(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.ws),
      color: getColor().themeColorWhite,
      child: Column(
        children: [
          AccountItemView(
            title: textLocalization('service.manager.name'),
            titleRight: controller.managerItem.name ?? textLocalization('service.manager.my'),
            isIconNext: true,
            isHighlightTitleRight: controller.txtNameController.text.isNotEmpty ? false : true,
            onPressed: () => buildOpenFarmName(context),
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),
          AccountItemView(
            title: textLocalization('service.manager.size.title'),
            titleRight: controller.managerItem.size,
            isIconNext: true,
            onPressed: () => controller.onGotoSize(),
          ),
        ],
      ),
    );
  }

  Widget buildManagerLocation(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.ws),
      color: getColor().themeColorWhite,
      child: Column(
        children: [
          AccountItemView(
            title: (controller.managerItem.addressLite?.length ?? 0) > 0 ? (controller.managerItem.addressLite ?? "") : textLocalization('service.manager.location'),
            isIconNext: true,
            onPressed: () => controller.onGotoLocation(),
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),
          AccountItemView(
            title: controller.managerItem.address?.isNotEmpty == true ? (controller.managerItem.address ?? "") : textLocalization('service.manager.location2'),
            isIconNext: true,
            onPressed: () => buildOpenAddress(context),
          ),
        ],
      ),
    );
  }

  buildOpenFarmName(BuildContext context) => AppDialog(
      context: context,
      title: '',
      description: textLocalization('service.manager.name.edit'),
      type: DialogType.INPUT,
      cancelText: textLocalization('dialog.ignore'),
      okText: textLocalization('dialog.save'),
      input: TextInputLineBorder(
        width: double.infinity,
        hint: '',
        hintTextStyle: text12.textColorB2B2B2,
        textTextStyle: text14.textColor141414,
        height: 36.hs,
        textEditingController: controller.txtNameController,
      ),
      onOkPressed: () => controller.updateFarm(name: controller.txtNameController.text)).show();

  buildOpenAddress(BuildContext context) => AppDialog(
      context: context,
      title: '',
      description: textLocalization('service.manager.location2'),
      type: DialogType.INPUT,
      cancelText: textLocalization('dialog.ignore'),
      okText: textLocalization('dialog.save'),
      input: TextInputLineBorder(
        width: double.infinity,
        hint: '',
        hintTextStyle: text12.textColorB2B2B2,
        textTextStyle: text14.textColor141414,
        height: 36.hs,
        textEditingController: controller.txtAddressController,
      ),
      onOkPressed: () => controller.updateFarm(address: controller.txtAddressController.text)).show();
}
