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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.clearDetail();
          openDetailBottomSheet(context, null);
        },
      ),
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

  void openDetailBottomSheet(BuildContext context, DeliveryModel? item) {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.7,
        padding: EdgeInsets.symmetric(vertical: 16.ws, horizontal: 24.ws),
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12.rs), topRight: Radius.circular(12.rs)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              DTextFromField(
                leftTitle: 'Tên:',
                hintText: 'Tên:',
                keyboardType: TextInputType.text,
                controller: controller.textName,
                textStyle: text14.bold.textColor141414,
              ),
              SizedBox(height: 10.ws),
              DTextFromField(
                leftTitle: 'Email:',
                hintText: 'Email:',
                keyboardType: TextInputType.text,
                controller: controller.textEmail,
                textStyle: text14.bold.textColor141414,
              ),
              SizedBox(height: 10.ws),
              DTextFromField(
                leftTitle: 'Phone:',
                hintText: 'Phone:',
                keyboardType: TextInputType.text,
                controller: controller.textSdt,
                textStyle: text14.bold.textColor141414,
              ),
              SizedBox(height: 10.ws),
              DTextFromField(
                leftTitle: 'Địa chỉ:',
                hintText: 'Địa chỉ:',
                keyboardType: TextInputType.visiblePassword,
                textStyle: text14.bold.textColor141414,
                controller: controller.textAddress,
              ),
              SizedBox(height: 10.ws),
              DTextFromField(
                leftTitle: 'CCCD:',
                hintText: 'CCCD:',
                keyboardType: TextInputType.visiblePassword,
                controller: controller.textCCCD,
                textStyle: text14.bold.textColor141414,
              ),
              SizedBox(height: 10.ws),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text('Nam', style: text14.bold.textColor141414),
                        leading: Radio<GenderType>(
                          value: GenderType.MEN,
                          groupValue: controller.genderType.value,
                          onChanged: (GenderType? value) {
                            controller.updateGender(value);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('Nữ', style: text14.bold.textColor141414),
                        leading: Radio<GenderType>(
                          value: GenderType.WOMEN,
                          groupValue: controller.genderType.value,
                          onChanged: (GenderType? value) {
                            controller.updateGender(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.hs),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: item != null ? 'Cập nhật' : 'Thêm',
                  textStyle: text14.bold.textColorWhite,
                  onPressed: () {
                    if (item != null) {
                      controller.updatePerson(item);
                    } else {
                      controller.addPerson();
                    }
                    Get.back();
                  },
                  width: 150.ws,
                  height: 40.ws,
                  radius: 5.rs,
                  isEnable: true,
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: colorWhite,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }
}
