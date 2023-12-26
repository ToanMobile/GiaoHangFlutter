import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/widgets/button/touchable_opacity.dart';
import 'package:flutter/material.dart';

import '../../../res/theme/theme_service.dart';
import '../../base/base_page.dart';
import './widget/manager_item_view.dart';
import 'home_controller.dart';

//ignore: must_be_immutable
class HomePage extends BasePage<HomeController> {
  @override
  Widget buildContentView(BuildContext context, HomeController controller) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              buildWidgetUserInfo(context),
              SizedBox(height: 10.ws),
              buildWidgetDonHang(),
            ],
          ),
        ),
      ),
    );
  }

  buildWidgetUserInfo(BuildContext context) => Container(
        width: double.infinity,
        height: 130.ws,
        decoration: BoxDecoration(
          color: getColor().bgThemeColorWhite,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0.5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.ws),
            Container(
              height: 50.ws,
              width: double.infinity,
              padding: EdgeInsets.only(left: 24.ws),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "${textLocalization("home.user.title")}${controller.user.name != null ? controller.user.name : ""}",
                        style: text26.medium.textColor141414.height14Per,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Visibility(
                      visible: false,
                      child: TouchableOpacity(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.ws),
                          child: Assets.icons.icNotification.svg(),
                        ),
                        onPressed: () {
                          showMessage(textLocalization('feature'));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50.ws,
              width: double.infinity,
              padding: EdgeInsets.only(left: 24.ws),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.ws),
                    child: Text('Biên bản giao hàng', style: text14.textColor141414),
                  ),
                  TouchableOpacity(
                    child: Padding(
                      key: controller.widgetKey,
                      padding: EdgeInsets.symmetric(horizontal: 24.ws, vertical: 4.ws),
                      child: Assets.icons.icMenu.svg(height: 24.ws, width: 20.ws),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      );

  buildWidgetTotal(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.ws,
      child: Wrap(
        spacing: 10.ws,
        children: [
          Container(
            color: colorEBEBEC,
            width: 80.ws,
            height: 70.ws,
            child: Column(
              children: [
                Text('Doanh thu', style: text14.textColor777777),
                Text('10', style: text14.bold.textColor141414),
              ],
            ),
          ),
          Container(
            color: colorEBEBEC,
            width: 80.ws,
            height: 70.ws,
            child: Column(
              children: [
                Text('Bán lẻ', style: text14.textColor777777),
                Text('20', style: text14.bold.textColor141414),
              ],
            ),
          ),
          Container(
            color: colorEBEBEC,
            width: 80.ws,
            height: 70.ws,
            child: Column(
              children: [
                Text('Đơn hàng', style: text14.textColor777777),
                Text('3', style: text14.bold.textColor141414),
              ],
            ),
          ),
          Container(
            color: colorEBEBEC,
            width: 80.ws,
            height: 70.ws,
            child: Column(
              children: [
                Text('Tồn kho', style: text14.textColor777777),
                Text('0', style: text14.bold.textColor141414),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildWidgetDonHang() => Container(
        width: double.infinity,
        height: 700.ws,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: colorWhite,
        ),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
            color: colorWhite,
            padding: EdgeInsets.symmetric(horizontal: 26.ws),
            child: ManagerItemView(
              item: controller.listOrder[index],
              onPressed: () {},
            ),
          ),
          shrinkWrap: true,
          separatorBuilder: (context, index) => Divider(
            indent: 24,
            endIndent: 24,
            height: 1,
            thickness: 0.5,
            color: color929394,
          ),
          itemCount: controller.listOrder.length,
        ),
      );
}
