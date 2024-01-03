import 'package:get/instance_manager.dart';

import 'delivery_car_controller.dart';
import 'delivery_controller.dart';
import 'delivery_person_controller.dart';

class DeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DeliveryController());
    Get.put(DeliveryCarController());
    Get.put(DeliveryPersonController());
  }
}
