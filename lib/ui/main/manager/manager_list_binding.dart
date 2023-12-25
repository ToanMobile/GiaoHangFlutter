import 'package:get/get.dart';

import 'manager_list_controller.dart';

class ManagerListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ManagerListController());
  }
}
