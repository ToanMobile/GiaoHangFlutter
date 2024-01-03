import 'package:get/get.dart';

import '../../ui/main/cabinet/cabinet_controller.dart';
import '../../ui/main/delivery/delivery_controller.dart';
import '../../ui/main/home/home_controller.dart';
import '../../ui/main/main_controller.dart';
import 'delivery/delivery_car_controller.dart';
import 'delivery/delivery_person_controller.dart';
import 'settings/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    //Home
    Get.put(HomeController());
    Get.put(CabinetController());
    //Get.put(DeliveryController());

    //Tab
    Get.put(DeliveryCarController());
    Get.put(DeliveryPersonController());
    Get.put(DeliveryController());

    //Settings
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
