import 'package:get/instance_manager.dart';

import 'delivery_controller.dart';

class DeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DeliveryController());
  }
}
