import 'package:get/get.dart';

import '../../../app/app_controller.dart';
import '../../../data/api/models/TUser.dart';
import '../../../data/api/repositories/delivery_repository.dart';
import '../../base/base_controller.dart';

class DeliveryController extends BaseController {
  final _deliveryRepository = Get.find<DeliveryRepository>();
  final _appController = Get.find<AppController>();
  var _user = TUser().obs;
}
