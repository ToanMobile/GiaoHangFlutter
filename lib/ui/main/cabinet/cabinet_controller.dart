import 'package:app_giao_hang/data/api/models/response/cabinet/cabinet_model.dart';
import 'package:app_giao_hang/data/api/repositories/cabinet_repository.dart';
import 'package:get/get.dart';

import '../../../app/app_controller.dart';
import '../../base/base_controller.dart';

class CabinetController extends BaseController {
  final _cabinetRepository = Get.find<CabinetRepository>();
  final _appController = Get.find<AppController>();
  List<CabinetModel> get listData => _listData$.value;
  final _listData$ = <CabinetModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    getListCabinet();
  }

  getListCabinet() async {
    showLoading();
    try {
      _listData$.value = await _cabinetRepository.getListCabinet() ?? List.empty();
      hideLoading();
    } catch (e) {
      hideLoading();
    }
  }
}
