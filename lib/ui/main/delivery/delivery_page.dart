import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/main/delivery/delivery_controller.dart';
import 'package:flutter/material.dart';

import '../../base/base_page.dart';
import '../../widgets/common_tab_bar.dart';
import '../../widgets/default_appbar.dart';
import 'delivery_car_page.dart';
import 'delivery_person_page.dart';

//ignore: must_be_immutable
class DeliveryPage extends BasePage<DeliveryController> {
  @override
  Widget buildContentView(BuildContext context, DeliveryController controller) {
    return Scaffold(
      appBar: DefaultAppbar(
        height: 100.ws,
        title: 'Danh sách Giao hàng',
        appBarStyle: AppBarStyle.NONE,
        tabBar: CommonTabBar.build(
          context,
          tabs: controller.myTabs,
          isScrollable: false,
          controller: controller.controller,
        ),
      ),
      body: TabBarView(
        controller: controller.controller,
        children: [
          DeliveryPersonPage(),
          DeliveryCarPage(),
        ],
      ),
    );
  }
}
