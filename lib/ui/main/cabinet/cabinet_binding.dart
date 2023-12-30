import 'package:get/instance_manager.dart';

import 'cabinet_controller.dart';

class CabinetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CabinetController());
  }
}
