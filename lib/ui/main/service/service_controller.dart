import 'package:get/get.dart';

import '../../../app/app_pages.dart';
import '../../base/base_controller.dart';

class ServiceController extends BaseController {

  @override
  void onInit() {
    super.onInit();
  }

  onGotoAddDevice() {
    Get.toNamed(AppRoutes.ADD_DEVICE);
  }

  onGotoManager() {
    Get.toNamed(AppRoutes.MANAGER, arguments: false);
  }

}
