import 'package:get/get.dart';

import 'manager_controller.dart';

class ManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ManagerController());
  }
}
