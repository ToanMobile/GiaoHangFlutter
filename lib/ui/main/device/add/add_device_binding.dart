import 'package:get/get.dart';

import 'add_device_controller.dart';

class AddDeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddDeviceController());
  }
}
