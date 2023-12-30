import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';

import '../../ui/base/base_page.dart';
import '../../ui/main/main_controller.dart';
import '../../ui/widgets/menu/custom_bottom_menu.dart';
import 'cabinet/cabinet_page.dart';
import 'delivery/delivery_page.dart';
import 'home/home_page.dart';
import 'settings/settings_page.dart';

//ignore: must_be_immutable
class MainPage extends BasePage<MainController> {
  final List<Widget> pages = [
    HomePage(),
    CabinetPage(),
    DeliveryPage(),
    SettingsPage()
  ];

  @override
  Widget buildContentView(BuildContext context, MainController controller) {
    initToast(context);
    final List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home),
        activeIcon: Icon(Icons.home, color: colorPrimary),
      ),
      BottomNavigationBarItem(
        label: 'Kiểm tủ',
        icon: Icon(Icons.store_mall_directory_outlined),
        activeIcon:
            Icon(Icons.store_mall_directory_outlined, color: colorPrimary),
      ),
      BottomNavigationBarItem(
        label: 'Giao hàng',
        icon: Icon(Icons.local_grocery_store_rounded),
        activeIcon:
            Icon(Icons.local_grocery_store_rounded, color: colorPrimary),
      ),
      BottomNavigationBarItem(
        label: 'Setting',
        icon: Icon(Icons.more_horiz),
        activeIcon: Icon(Icons.more_horiz, color: colorPrimary),
      ),
    ];
    return Scaffold(
      body: buildPage(context),
      bottomNavigationBar: CustomBottomNenu(
        type: BottomNavigationBarType.fixed,
        index: controller.pageIndex.value,
        items: items,
        onTabChanged: (value) {
          controller.onTabChanged(value);
        },
        selectedItemColor: colorPrimary,
        unselectedItemColor: color929394,
      ),
    );
  }

  buildPage(BuildContext context) {
    return SizedBox.expand(
      child: PageView(
        controller: controller.pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {},
        children: pages,
      ),
    );
  }
}
