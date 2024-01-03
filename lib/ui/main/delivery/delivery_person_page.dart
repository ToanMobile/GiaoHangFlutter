import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/main/delivery/widget/delivery_person_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/models/response/delivery/delivery_model.dart';
import '../../base/base_page.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/input/text_form_field_widget.dart';
import 'delivery_person_controller.dart';

//ignore: must_be_immutable
class DeliveryPersonPage extends BasePage<DeliveryPersonController> {
  @override
  Widget buildContentView(BuildContext context, DeliveryPersonController controller) {
    return Scaffold(
      body: buildWidgetListData(),
    );
  }

  buildWidgetListData() => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: colorWhite,
        ),
        child: ListView.separated(
          itemBuilder: (context, index) {
            final item = controller.listData[index];
            return Container(
              color: colorWhite,
              padding: EdgeInsets.symmetric(horizontal: 26.ws),
              child: DeliveryPersonItemView(
                item: item,
                onPressed: () {
                  controller.showDetail(item);
                  openDetailBottomSheet(context, item);
                },
              ),
            );
          },
          shrinkWrap: true,
          separatorBuilder: (context, index) => Divider(
            indent: 24,
            endIndent: 24,
            height: 1,
            thickness: 0.5,
            color: color929394,
          ),
          itemCount: controller.listData.length,
        ),
      );

  void openDetailBottomSheet(BuildContext context, DeliveryModel item) {
    Get.bottomSheet(
      SizedBox(
        height: 700.ws,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              DTextFromField(
                leftTitle: 'Tên:',
                hintText: textLocalization("login.password"),
                keyboardType: TextInputType.text,
                controller: controller.textName,
                textStyle: text14.bold.textColor141414,
              ),
              SizedBox(height: 10.ws),
              DTextFromField(
                leftTitle: 'Email:',
                hintText: textLocalization("login.password"),
                keyboardType: TextInputType.text,
                controller: controller.textEmail,
                textStyle: text14.bold.textColor141414,
              ),
              SizedBox(height: 10.ws),
              DTextFromField(
                leftTitle: 'Phone:',
                hintText: textLocalization("login.password"),
                keyboardType: TextInputType.text,
                controller: controller.textSdt,
                textStyle: text14.bold.textColor141414,
              ),
              SizedBox(height: 10.ws),
              DTextFromField(
                leftTitle: 'Địa chỉ:',
                hintText: textLocalization("login.password"),
                keyboardType: TextInputType.visiblePassword,
                textStyle: text14.bold.textColor141414,
                controller: controller.textAddress,
              ),
              SizedBox(height: 10.ws),
              DTextFromField(
                leftTitle: 'Giới tính:',
                hintText: textLocalization("login.password"),
                keyboardType: TextInputType.visiblePassword,
                controller: controller.textSex,
                textStyle: text14.bold.textColor141414,
              ),
              SizedBox(
                height: 20.hs,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: "Cập nhật",
                  textStyle: text14.bold.textColorWhite,
                  onPressed: () => Get.back(),
                  width: 150.ws,
                  height: 32.ws,
                  radius: 5.rs,
                  isEnable: true,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: colorWhite,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }
}
