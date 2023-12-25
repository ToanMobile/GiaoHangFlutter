import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/widgets/button/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/storage/key_constant.dart';
import '../../../../res/theme/theme_service.dart';
import '../../base/base_page.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/input/text_form_field_widget.dart';
import '../manager/manager_controller.dart';

//ignore: must_be_immutable
class ManagerSizePage extends BasePage<ManagerController> {
  @override
  Widget buildContentView(BuildContext context, ManagerController controller) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: textLocalization('service.manager.size.title'),
        appBarStyle: AppBarStyle.BACK,
        actions: [
          TouchableOpacity(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textLocalization('dialog.save2'),
                style: text16.bold.textColorPrimary,
              ),
            ),
            onPressed: () {
              controller.updateFarm(
                  size: controller.textSize1Cl.text,
                  unit: controller.sizeType.value == SIZE_TYPE.HA
                      ? 'ha'
                      : controller.sizeType.value == SIZE_TYPE.M2
                          ? 'm2'
                          : '',
                  errorMessage: (error) {
                    if (error.isEmpty) {
                      Get.back();
                    } else {
                      showMessage(error);
                    }
                  });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSettingsSize(context),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsSize(BuildContext context) {
    return Container(
      color: getColor().themeColorWhite,
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            ClearTextField(
                hint: textLocalization("service.size.count"),
                underlineColor: Colors.transparent,
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                keyboardType: TextInputType.number,
                controller: controller.textSize1Cl,
                textStyle: text14.height20Per.textColor141414
                /*onValidated: (val) {
                return controller.validatorEmpty(controller.textSize1Cl.text, textLocalization("service.size.count"));
              },*/
                ),
            Divider(height: 1, thickness: 0.5, color: color929394),
            TouchableOpacity(
              child: Container(
                color: colorWhite,
                height: 48.hs,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 16.ws),
                child: Text(
                  controller.sizeType.value == SIZE_TYPE.M2
                      ? textLocalization('service.size.m2')
                      : controller.sizeType.value == SIZE_TYPE.HA
                          ? textLocalization('service.size.ha')
                          : textLocalization("service.size.count2"),
                  style: controller.sizeType.value == SIZE_TYPE.NONE ? text14.height20Per.textColorB2B2B2 : text14.height20Per.textColor141414,
                ),
              ),
              onPressed: () => openBottomSheet(),
            ),
          ],
        ),
      ),
    );
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.hs),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.ws, vertical: 12.hs),
            child: Text(
              textLocalization('service.size.count2'),
              style: text14.bold.textColor141414,
            ),
          ),
          TouchableOpacity(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.ws, vertical: 12.hs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textLocalization('service.size.m2'),
                    style: text14.textColor141414,
                  ),
                  controller.sizeType.value == SIZE_TYPE.M2 ? Icon(Icons.check, size: 16) : SizedBox()
                ],
              ),
            ),
            onPressed: () => controller.updateSizeType(SIZE_TYPE.M2),
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),
          TouchableOpacity(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.ws, vertical: 12.hs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textLocalization('service.size.ha'),
                    style: text14.textColor141414,
                  ),
                  controller.sizeType.value == SIZE_TYPE.HA ? Icon(Icons.check, size: 16) : SizedBox()
                ],
              ),
            ),
            onPressed: () => controller.updateSizeType(SIZE_TYPE.HA),
          ),
          SizedBox(height: 10),
        ],
      ),
      backgroundColor: colorWhite,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }
}
