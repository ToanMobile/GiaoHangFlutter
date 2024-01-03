import 'package:app_giao_hang/data/api/models/response/delivery/car_model.dart';
import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/base_page.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/input/text_form_field_widget.dart';
import 'delivery_car_controller.dart';
import 'widget/delivery_car_item_view.dart';

//ignore: must_be_immutable
class DeliveryCarPage extends BasePage<DeliveryCarController> {
  @override
  Widget buildContentView(BuildContext context, DeliveryCarController controller) {
    return Scaffold(
      body: buildWidgetListData(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.clearDetail();
          openCarBottomSheet(context, null);
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
              child: DeliveryCarItemView(
                item: item,
                onPressed: () {
                  controller.showDetail(item);
                  openCarBottomSheet(context, item);
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

  void openCarBottomSheet(BuildContext context, CarModel? item) {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.3,
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
                leftTitle: 'Biển số:',
                hintText: 'Biển số:',
                keyboardType: TextInputType.text,
                controller: controller.textPlate,
                textStyle: text14.bold.textColor141414,
              ),
              SizedBox(height: 20.hs),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: item != null ? 'Cập nhật' : 'Thêm',
                  textStyle: text14.bold.textColorWhite,
                  onPressed: () {
                    if (item != null) {
                      controller.updateCar(item);
                    } else {
                      controller.addCar();
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
      backgroundColor: colorWhite,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }
}
