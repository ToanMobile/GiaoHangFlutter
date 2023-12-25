import 'package:get/get.dart';

import 'manager_controller_search.dart';

class ManagerSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ManagerSearchController());
  }
}
