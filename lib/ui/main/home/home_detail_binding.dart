import 'package:get/instance_manager.dart';

import 'home_detail_controller.dart';

class HomeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeDetailsController());
  }
}
