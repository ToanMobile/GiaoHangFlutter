import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/auth/update/update_profile_controller.dart';
import 'package:flutter/material.dart';

import '../../../res/theme/theme_service.dart';
import '../../base/base_page.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/input/text_input_line_border.dart';

// ignore: must_be_immutable
class UpdateProfilePage extends BasePage<UpdateProfileController> {
  @override
  Widget buildContentView(
      BuildContext context, UpdateProfileController controller) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: getColor().bgThemeColorWhite,
        title: Text(
          "Cập nhật thông tin",
          style: text18.medium.textColor141414,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.ws),
        child: ListView(
          children: [
            SizedBox(
              height: 80.ws,
            ),
            Row(
              children: [
                Text(
                  "Họ tên",
                  style: text14.medium.textColor141414,
                ),
                Text(
                  " *",
                  style: text14.textColorB90D18,
                ),
              ],
            ),
            SizedBox(
              height: 8.ws,
            ),
            TextInputLineBorder(
                hint: "Nhập họ tên",
                hintTextStyle: text16.textColorB2B2B2,
                textTextStyle: text16.textColor141414,
                height: 44.ws,
                textEditingController: controller.nameController),
            SizedBox(
              height: 40.ws,
            ),
            CustomButton(
                text: "Hoàn thành",
                width: 315.ws,
                height: 44.ws,
                radius: 5.ws,
                textStyle: controller.isEnable.value
                    ? text16.bold.textColorWhite
                    : text16.bold.textColor777777,
                isEnable: controller.isEnable.value,
                onPressed: () {
                  controller.updateProfile();
                })
          ],
        ),
      ),
    );
  }
}
