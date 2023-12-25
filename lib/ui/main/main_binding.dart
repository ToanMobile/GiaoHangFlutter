import 'package:app_giao_hang/ui/main/product/product_controller.dart';
import 'package:get/get.dart';

import '../../ui/main/home/home_controller.dart';
import '../../ui/main/main_controller.dart';
import 'settings/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    //Home
    Get.put(HomeController());

    //Service
    Get.put(ProductController());

    //Settings
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
