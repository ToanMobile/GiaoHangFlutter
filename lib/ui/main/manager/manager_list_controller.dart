import 'package:app_giao_hang/data/api/models/farm/farm_item.dart';
import 'package:get/get.dart';

import '../../../app/app_pages.dart';
import '../../base/base_controller.dart';

class ManagerListController extends BaseController {
  RxBool updateListFarm = false.obs;

  onGotoManagerUpdateFarm(FarmItem? farmItem) {
    print('onGotoManagerUpdateFarm::' + farmItem.toString());
    Get.toNamed(AppRoutes.MANAGER, arguments: farmItem)?.then((value) {
      updateListFarm.value = !updateListFarm.value;
    });
  }
}
