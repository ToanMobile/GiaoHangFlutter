import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/widgets/button/touchable_opacity.dart';
import 'package:app_giao_hang/ui/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:open_settings/open_settingsainer_widget.dart';

import '../../../../../data/storage/key_constant.dart';
import '../../../base/base_page.dart';
import '../../../widgets/base_scaffold_widget.dart';
import '../../../widgets/button/custom_button.dart';
import '../../../widgets/count_down_timer_widget.dart';
import '../../../widgets/default_appbar.dart';
import '../../../widgets/dialogs/app_dialog.dart';
import '../../../widgets/input/text_form_field_widget.dart';
import '../../../widgets/input/text_input_line_border.dart';
import 'add_device_controller.dart';

//ignore: must_be_immutable
class AddDevicePage extends BasePage<AddDeviceController> {
  @override
  Widget buildContentView(BuildContext context, AddDeviceController controller) {
    return ScaffoldBase(
      appBar: DefaultAppbar(title: textLocalization('home.add.title'), appBarStyle: AppBarStyle.BACK),
      body: SingleChildScrollView(
        child: buildWidgetRoot(context),
      ),
    );
  }

  buildWidgetRoot(BuildContext context) {
    if (controller.checkGpsPermission.value) {
      controller.updateOffCheckGps();
      Future.delayed(Duration(seconds: 1), () {
        showDialogPermission(context);
      });
    }
    switch (controller.stepType.value) {
      case ADD_DEVICE_TYPE.WIFI:
        return buildWidgetScreenWifi(context);
      case ADD_DEVICE_TYPE.SEARCH:
        return buildWidgetScreenSearch(context);
      case ADD_DEVICE_TYPE.REGISTER:
        return buildWidgetScreenRegister(context, true);
      default:
        return buildWidgetScreenRegister(context, true);
    }
  }

  buildWidgetScreenWifi(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: Get.height - 190.hs,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(textLocalization('home.add.wifi'), style: text20.bold.textColor141414),
                SizedBox(height: 40),
                Text(
                  textLocalization('home.add.wifi.des'),
                  style: text14.textColor141414,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                buildWidgetWifi(),
                SizedBox(height: 40),
                buildWidgetInput(),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomButton(
              text: textLocalization('dialog.start'),
              onPressed: () {
                controller.startConnect(showVerifyCode: () {
                  showDialogInput(context);
                }, errorMessage: (error) {
                  //showMessage(context, error);
                  showDialogError(context, error, isBack: false);
                });
              },
              isEnable: true,
              width: double.infinity,
              textStyle: text14.bold.textColorWhite,
              height: 42.ws,
              radius: 5.rs,
            ),
          ),
        ],
      ),
    );
  }

  buildWidgetScreenSearch(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 40.hs),
        Text(
          textLocalization('home.add.wifi.search.des'),
          style: text14.textColor141414,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 100.hs),
        Assets.icons.icDeviceZoomIn.svg(),
        SizedBox(height: 10.hs),
        buildCountDownTimer(context),
        SizedBox(height: 66.hs),
        buildTimeLine(),
      ],
    );
  }

  buildWidgetScreenRegister(BuildContext context, bool isCreate) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 40.hs),
        Text(
          textLocalization('home.add.wifi.search.des'),
          style: text14.textColor141414,
          textAlign: TextAlign.center,
        ),
        isCreate
            ? Column(
                children: [
                  SizedBox(height: 10.hs),
                  SizedBox(
                    width: double.infinity,
                    height: 400.hs,
                    child: Lottie.asset(Assets.json.icLoading),
                  ),
                  SizedBox(height: 10.hs),
                  buildCountDownTimer(context),
                ],
              )
            : Column(
                children: [
                  SizedBox(height: 90.hs),
                  Assets.icons.icDeviceLoading.svg(),
                  SizedBox(height: 90.hs),
                ],
              ),
        buildTimeLine(),
      ],
    );
  }

  Widget buildCountDownTimer(BuildContext context) => CountDownTimerWidget(
        start: 90,
        isOtp: false,
        textStyle: text16.bold.textColor141414,
        reload: controller.timerNotifier,
        endCountDown: () {
          showDialogError(context, textLocalization('dialog.device.content.error'));
        },
        onResend: () {},
      );

  Widget buildTimeLine() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              controller.stepType == ADD_DEVICE_TYPE.SEARCH ? Assets.icons.icProcessingPoint.svg() : Assets.icons.icWaitingPoint.svg(),
              Expanded(child: Container(height: 1, color: colorB2B2B2, width: double.infinity)),
              controller.stepType == ADD_DEVICE_TYPE.REGISTER ? Assets.icons.icProcessingPoint.svg() : Assets.icons.icWaitingPoint.svg(),
              Expanded(child: Container(height: 1, color: colorB2B2B2, width: double.infinity)),
              controller.stepType == ADD_DEVICE_TYPE.CREATE ? Assets.icons.icProcessingPoint.svg() : Assets.icons.icWaitingPoint.svg(),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(textLocalization('home.add.wifi.search'), style: text14.textColor141414),
              Padding(padding: EdgeInsets.only(left: 35.ws), child: Text(textLocalization('signup.title'), style: text14.textColor141414)),
              Text(textLocalization('home.add.wifi.create'), style: text14.textColor141414),
            ],
          )
        ],
      );

  buildWidgetWifi() {
    return SizedBox(
      width: double.infinity,
      height: 200.hs,
      child: Assets.images.imgWifi
          .image() /*ListView.separated(
        itemBuilder: (context, index) => TouchableOpacity(
          child: ContainerBase(
            color: colorWhite,
            isMargin: true,
            child: Row(
              children: [
                index < 2 ? Icon(Icons.clear, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                SizedBox(width: 4),
                Text(
                  controller.wifiResults[index],
                  style: text14.bold.textColor141414,
                ),
                Spacer(),
                Assets.icons.icLock.svg(),
                SizedBox(width: 4),
                Icon(Icons.wifi, color: Colors.black26),
                SizedBox(width: 4),
                Icon(Icons.info_outline, color: Colors.blue.shade200)
              ],
            ),
          ),
          onPressed: () => controller.pickWifi(controller.wifiResults[index]),
        ),
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 0.1,
          color: getColor().textColor141414,
        ),
        itemCount: controller.wifiResults.length,
      )*/
      ,
    );
  }

  buildWidgetInput() {
    return ContainerBase(
      color: colorWhite,
      height: 96.hs,
      width: Get.width - 100.ws,
      isMargin: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 40.hs,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.wifi, color: color141414, size: 16),
                SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      controller.wifiName.value,
                      style: text14.textColor141414,
                    ),
                  ),
                ),
                TouchableOpacity(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.ws),
                    child: Assets.icons.icSwapHoriz.svg(),
                  ),
                  onPressed: () {
                    OpenSettings.openWIFISetting();
                  },
                ),
              ],
            ),
          ),
          Divider(height: 1, color: colorBackground),
          ClearTextField(
              prefixIcon: Assets.icons.icLock.svg(),
              hint: textLocalization("login.password"),
              keyboardType: TextInputType.visiblePassword,
              underlineColor: Colors.transparent,
              controller: controller.passwordController,
              textStyle: text14.textColor141414,
              contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0)
              /*onValidated: (val) {
                    return controller.validatorPassword(textLocalization("login.password"));
                  },*/
              ),
        ],
      ),
    );
  }

  void showDialogInput(BuildContext context) {
    AppDialog(
      context: context,
      title: textLocalization('dialog.device.title'),
      description: '${textLocalization('dialog.device.des').trParams(
        {
          'field': 'UEV-THL',
        },
      )} \n ${textLocalization('dialog.device.verify')}',
      type: DialogType.INPUT,
      cancelText: textLocalization('dialog.ignore'),
      okText: textLocalization('dialog.connect'),
      input: TextInputLineBorder(
        width: double.infinity,
        hint: textLocalization('dialog.device.verify'),
        hintTextStyle: text12.textColorB2B2B2,
        textTextStyle: text14.textColor141414,
        height: 36.hs,
        textCapitalization: TextCapitalization.characters,
        textEditingController: controller.verifyCodeController,
        onComplete: (value) {
          Get.back();
          controller.startConnect(errorMessage: (error) {
            showDialogError(context, error, isBack: false);
          });
        },
      ),
      onOkPressed: () => controller.startConnect(errorMessage: (error) {
        showDialogError(context, error, isBack: false);
      }),
    ).show();
  }

  void showDialogError(BuildContext context, String errorString, {bool isBack = true}) {
    AppDialog(
      context: context,
      title: isBack ? textLocalization('dialog.device.title.error') : '',
      description: errorString,
      type: DialogType.TEXT,
      okText: textLocalization('dialog.confirm'),
      onOkPressed: () {
        if (isBack) {
          controller.dispose();
          Get.back();
          Get.back();
        }
      },
    ).show();
  }

  void showDialogPermission(BuildContext context) {
    return AppDialog(
      context: context,
      description: textLocalization('dialog.permission.location'),
      type: DialogType.TEXT,
      okText: textLocalization('dialog.confirm'),
      onOkPressed: () {
        controller.requestGps();
      },
    ).show();
  }
}
