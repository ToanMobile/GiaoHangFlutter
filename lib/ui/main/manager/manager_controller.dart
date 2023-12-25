import 'package:app_giao_hang/data/api/models/TUser.dart';
import 'package:app_giao_hang/data/api/models/farm/farm_item.dart';
import 'package:app_giao_hang/data/storage/key_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_controller.dart';
import '../../../app/app_pages.dart';
import '../../../data/api/models/urvega/manager_item.dart';
import '../../../data/api/repositories/farm_repository.dart';
import '../../../res/style.dart';
import '../../base/base_controller.dart';
import '../main_controller.dart';

class ManagerController extends BaseController {
  final _mainController = Get.find<MainController>();
  final _farmRepository = Get.find<FarmRepository>();
  final user = Get.find<AppController>().user ?? TUser();
  FarmItem? farmItem = Get.arguments as FarmItem?;
  final textEmailCl = TextEditingController();
  final textSize1Cl = TextEditingController();
  final txtNameController = TextEditingController();
  final txtAddressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool buttonEnable = false.obs;
  final sizeType = SIZE_TYPE.NONE.obs;

  bool get validate => GetUtils.isEmail(textEmailCl.text);
  var _managerItem = ManagerItem().obs;

  ManagerItem get managerItem => _managerItem.value;

  @override
  void onInit() {
    super.onInit();
    textEmailCl.addListener(_controllerListener);
    syncFarmData();
  }

  bool get isUpdate => farmItem != null;

  void syncFarmData() {
    if (isUpdate) {
      List<String>? address = farmItem?.address?.split(",");
      print("address::" + address.toString());
      txtNameController.text = farmItem?.name ?? "";
      textSize1Cl.text = farmItem?.acreage?.toStringAsFixed(1) ?? "";
      sizeType.value = farmItem?.unit == SIZE_TYPE.HA.name ? SIZE_TYPE.HA : (farmItem?.unit == SIZE_TYPE.M2.name ? SIZE_TYPE.M2 : SIZE_TYPE.M2);
      txtAddressController.text = address?[0] ?? "";
      _managerItem.value = ManagerItem(
        name: txtNameController.text.toString(),
        size: farmItem?.acreage?.toStringAsFixed(1),
        unit: farmItem?.unit,
        address: address != null ? address[0] : "",
        ward: (address != null && address.length > 1) ? address[1] : "",
        district: (address != null && address.length > 2) ? address[2] : "",
        province: (address != null && address.length > 3) ? address[3] : "",
      );
    }
  }

  void _controllerListener() {
    formKey.currentState?.validate();
    buttonEnable.value = validate;
  }

  String? validatorEmpty(String text, String fieldName) {
    return (GetUtils.isNullOrBlank(text) == true)
        ? 'sign_up_msg_is_required'.trParams(
            {
              'field': fieldName,
            },
          )
        : GetUtils.isLengthLessThan(text, 1)
            ? 'sign_up_msg_is_at_least_3_characters'.trParams(
                {
                  'field': fieldName,
                },
              )
            : null;
  }

  String? validatorEmail(String fieldName) {
    return GetUtils.isNullOrBlank(textEmailCl.text) == true || !GetUtils.isEmail(textEmailCl.text)
        ? 'sign_up_msg_is_required'.trParams({
            'field': fieldName,
          })
        : null;
  }

  changeEmail(Function(String) errorMessage) async {
    showLoading();
    Future.delayed(Duration(seconds: 1), () async {
      try {
        buttonEnable.value = false;
        //await _userRespository.loginByPhone(""); //TODO
        hideLoading();
        buttonEnable.value = true;
        //Get.toNamed(AppRoutes.OTP_REGISTER, arguments: [textEmailCl.text, OtpType.register]);
      } catch (e) {
        buttonEnable.value = true;
        hideLoading();
        errorMessage(getErrors(e));
      }
    });
  }

  onGotoLocation() {
    Get.toNamed(AppRoutes.MANAGER_SEARCH_LOCATION);
  }

  onGotoSize() {
    Get.toNamed(AppRoutes.MANAGER_SIZE);
  }

  void updateSizeType(SIZE_TYPE sizeTypeUpdate) {
    sizeType.value = sizeTypeUpdate;
    Get.back();
  }

  void updateFarm({String? name, String? size, String? unit, String? address, String? ward, String? district, String? province, Function(String)? errorMessage}) {
    if (name != null) {
      _managerItem.update((_managerItem) {
        managerItem.name = name;
      });
      txtNameController.text = name;
    }
    if (unit != null && size != 0.0) {
      if (validatorEmpty(unit, textLocalization("service.manager.size.title")) != null) {
        if (errorMessage != null) errorMessage(validatorEmpty(unit, textLocalization("service.manager.size.title")) ?? '');
        return;
      }
      _managerItem.update((_managerItem) {
        managerItem.size = size;
        managerItem.unit = unit;
      });
      if (errorMessage != null) errorMessage('');
    }
    if (address != null) {
      _managerItem.update((_managerItem) {
        managerItem.address = address;
      });
      txtAddressController.text = address;
    }
    if (ward != null) {
      _managerItem.update((_managerItem) {
        managerItem.ward = ward;
      });
    }
    if (district != null) {
      _managerItem.update((_managerItem) {
        managerItem.district = district;
      });
    }
    if (province != null) {
      _managerItem.update((_managerItem) {
        managerItem.province = province;
      });
    }
    print('_managerItem:::${managerItem}');
  }

  addOrUpdateFarm(Function(String) errorMessage) async {
    showLoading();
    try {
      buttonEnable.value = false;
      if (isUpdate) {
        await _farmRepository.updateFarm(
          fk: farmItem?.fkey ?? '',
          name: managerItem.name ?? '',
          acreage: managerItem.size ?? "",
          unit: managerItem.unit ?? '',
          address: managerItem.addressFull ?? '',
        );
      } else {
        await _farmRepository.createFarm(
          name: managerItem.name ?? '',
          acreage: managerItem.size ?? "",
          unit: managerItem.unit ?? '',
          address: managerItem.addressFull ?? '',
        );
      }
      await _mainController.getListFarm();
      hideLoading();
      buttonEnable.value = true;
      Get.back(result: true);
    } catch (e) {
      buttonEnable.value = true;
      hideLoading();
      errorMessage(getErrors(e));
    }
  }

  onGotoManagerUpdateFarm(FarmItem? farmItem) {
    print('onGotoManagerUpdateFarm::' + farmItem.toString());
    Get.toNamed(AppRoutes.MANAGER, arguments: farmItem);
  }

  @override
  void dispose() {
    textEmailCl.removeListener(_controllerListener);
    textEmailCl.dispose();
    txtAddressController.dispose();
    textSize1Cl.dispose();
    super.dispose();
  }
}
