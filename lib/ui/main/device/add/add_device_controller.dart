import 'dart:async';

import 'package:app_giao_hang/app/app_pages.dart';
import 'package:app_giao_hang/ui/main/home/home_controller.dart';
import 'package:app_giao_hang/ui/widgets/dialogs/app_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as loc;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';

import '../../../../../data/storage/key_constant.dart';
import '../../../../../res/style.dart';
import '../../../../data/api/models/device/device_new.dart';
import '../../../../data/api/repositories/device_repository.dart';
import '../../../../utils/permission_handle_manager.dart';
import '../../../base/base_controller.dart';
import '../../main_controller.dart';

class AddDeviceController extends BaseController with GetSingleTickerProviderStateMixin {
  final _deviceRepository = Get.find<DeviceRepository>();
  final _homeController = Get.find<HomeController>();
  final _mainController = Get.find<MainController>();
  final passwordController = TextEditingController(); //..text = '123456788';
  final verifyCodeController = TextEditingController(); //..text = 'ZLOALC';
  final stepType = ADD_DEVICE_TYPE.WIFI.obs;
  final wifiName = ''.obs;
  final isTestPair = false;
  ValueNotifier timerNotifier = ValueNotifier(null);

  //Connect Device
  final checkGpsPermission = false.obs;
  final networkInfo = NetworkInfo();
  DeviceItemNew deviceItemNew = DeviceItemNew();
  var ssidName = "";
  Timer? periodicTimer = null;

  @override
  void onInit() async {
    super.onInit();
    await checkGps();
  }

  Future checkGps() async {
    try {
      loc.Location location = loc.Location();
      if (!await location.serviceEnabled()) {
        checkGpsPermission.value = true;
      } else {
        location.requestService().then((value) => getInfoWifi());
      }
    } catch (e) {}
  }

  void updateOffCheckGps() {
    checkGpsPermission.value = false;
  }

  Future<void> requestGps() async {
    try {
      loc.Location location = loc.Location();
      if (!await location.serviceEnabled()) {
        location.requestService().then((value) => getInfoWifi());
      }
    } catch (e) {}
  }

  void getInfoWifi() async {
    bool isGranted = await PermissionHandleManager().requestWifiInfoPermisson();
    if (isGranted) {
      String? wifiNameCurrent = await networkInfo.getWifiName();
      wifiName.value = (wifiNameCurrent ?? 'Unknown').replaceAll("\"", "");
      print("networkInfo:::" + wifiName.toString());
    }
  }

  String? validatorPassword(String fieldName) {
    return (GetUtils.isNullOrBlank(passwordController.text) == true)
        ? textLocalization('home.add.wifi.pass.empty')
        : GetUtils.isLengthLessThan(passwordController.text, 6)
            ? 'sign_up_msg_is_at_least_6_characters'.trParams(
                {
                  'field': fieldName,
                },
              )
            : null;
  }

  void startConnect({Function()? showVerifyCode, Function(String)? errorMessage}) async {
    print("startConnect::" + stepType.value.toString());
    if (stepType.value == ADD_DEVICE_TYPE.WIFI) {
      AppPopup.pairDevice = true;
      if (wifiName.value == 'Unknown' || wifiName.value == '') {
        if (errorMessage != null) errorMessage(textLocalization("dialog.request.wifi"));
        return;
      }
      if (validatorPassword(textLocalization("login.password")) != null) {
        if (errorMessage != null) errorMessage(validatorPassword(textLocalization("login.password")) ?? '');
        return;
      }
      stepType.value = ADD_DEVICE_TYPE.SEARCH;
      if (isTestPair) {
        if (showVerifyCode != null) showVerifyCode();
        return;
      }
      scanWifi(showVerifyCode);
      periodicTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
        scanWifi(showVerifyCode);
      });
    } else if (stepType.value == ADD_DEVICE_TYPE.SEARCH) {
      stepType.value = ADD_DEVICE_TYPE.REGISTER;
      print("SEARCH:ssidName::" + ssidName.toString());
      if (isTestPair) {
        Future.delayed(Duration(seconds: 5), () async {
          startConnect();
        });
        return;
      }
      if (ssidName.isNotEmpty) {
        await WiFiForIoTPlugin.forceWifiUsage(true);
        await WiFiForIoTPlugin.findAndConnect(
          ssidName,
          password: verifyCodeController.text.length > 0 ? "UR${verifyCodeController.text.toString()}GA" : "URZLOALCGA",
          joinOnce: true,
          withInternet: false,
        ).then((isConnect) async {
          print("connectOK::" + isConnect.toString());
          if (isConnect) {
            await WiFiForIoTPlugin.forceWifiUsage(true);
            deviceItemNew = await _deviceRepository.pairDevice(wifi: wifiName.value, password: passwordController.text) ?? DeviceItemNew();
            if (deviceItemNew.sn != null && deviceItemNew.code != null) {
              startConnect();
            } else {
              if (errorMessage != null) {
                errorMessage(textLocalization('dialog.device.title.error'));
              }
            }
          } else {
            Future.delayed(Duration(seconds: 5), () async {
              await WiFiForIoTPlugin.forceWifiUsage(true);
              deviceItemNew = await _deviceRepository.pairDevice(wifi: wifiName.value, password: passwordController.text) ?? DeviceItemNew();
              if (deviceItemNew.sn != null && deviceItemNew.code != null) {
                startConnect();
              } else {
                if (errorMessage != null) {
                  errorMessage(textLocalization('dialog.device.title.error'));
                }
              }
            });
            print("SEARCH:errorMessage::" + 'dialog.device.title.error');
            if (errorMessage != null) {
              errorMessage(textLocalization('dialog.device.content.error'));
            }
          }
        });
      }
    } else if (stepType.value == ADD_DEVICE_TYPE.REGISTER) {
      stepType.value = ADD_DEVICE_TYPE.CREATE;
      print("REGISTER:ssidName::" + wifiName.value.toString() + "password::" + passwordController.text);
      print("wifiName::" + wifiName.value + "passwordController:::" + passwordController.text + "ssidName:::" + ssidName);
      if (isTestPair) {
        Future.delayed(Duration(seconds: 5), () async {
          startConnect();
        });
        return;
      }
      //TODO REMOVE
      //await WiFiForIoTPlugin.disconnect();
      await WiFiForIoTPlugin.forceWifiUsage(false);
      _mainController.checkConnectInternet();
      periodicTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
        print("InternetConnectionChecker::" + (await _mainController.connectionCheck.isConnected).toString());
        if (await _mainController.connectionCheck.isConnected) {
          periodicTimer?.cancel();
          _deviceRepository.verifyDevice(sn: deviceItemNew.sn, code: deviceItemNew.code).then((value) {
            if (value) {
              startConnect();
            } else {
              verifyDeviceRetry();
            }
          });
        }
      });
      //TODO
      /*WiFiForIoTPlugin.findAndConnect(
        wifiName.value,
        password: passwordController.text,
        withInternet: true,
      ).then((isConnect) async {
        print("connectOK::" + isConnect.toString());
        await WiFiForIoTPlugin.forceWifiUsage(true);
        if (isConnect) {
          verifyDevice();
        } else {
          periodicTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
            print("isConnected::" + (await WiFiForIoTPlugin.isConnected()).toString());
            if (await WiFiForIoTPlugin.isConnected()) {
              periodicTimer?.cancel();
              verifyDevice();
            }
          });
        }
      });*/
    } else {
      print("Get.until((route) => Get.currentRoute == AppRoutes.MAIN::" + stepType.value.toString());
      AppPopup.pairDevice = false;
      _homeController.autoRefreshList();
      Get.until((route) => Get.currentRoute == AppRoutes.MAIN);
    }
  }

  void scanWifi(Function()? showVerifyCode) async {
    final can = await WiFiScan.instance.canGetScannedResults(askPermissions: true);
    switch (can) {
      case CanGetScannedResults.yes:
        final accessPoints = await WiFiScan.instance.getScannedResults();
        print("ssidName::" + ssidName.toString());
        accessPoints.forEach((accessPoint) {
          print("accessPoint::" + accessPoint.ssid.toString());
          if (accessPoint.ssid.startsWith("URVEGA-") == true) {
            periodicTimer?.cancel();
            ssidName = accessPoint.ssid ?? "";
            print("WiFiScan::" + ssidName.toString());
            if (showVerifyCode != null) {
              showVerifyCode();
            }
          }
        });
        break;
      default:
        break;
    }
    /*
    await WiFiForIoTPlugin.loadWifiList().then((value) {
      print("ssidName::" + ssidName.toString());
      value.forEach((accessPoint) {
        print("accessPoint::" + accessPoint.ssid.toString());
        if (accessPoint.ssid?.startsWith("URVEGA-") == true) {
          periodicTimer?.cancel();
          ssidName = accessPoint.ssid ?? "";
          print("WiFiScan::" + ssidName.toString());
          if (showVerifyCode != null) {
            showVerifyCode();
          }
        }
      });
    });*/
  }

  void verifyDeviceRetry() async {
    print("verifyDeviceRetry::");
    Timer.periodic(Duration(seconds: 3), (timer) {
      _deviceRepository.verifyDevice(sn: deviceItemNew.sn, code: deviceItemNew.code).then((value) {
        if (value) {
          timer.cancel();
          startConnect();
        }
      });
    });
  }

  void pickWifi(String name) {
    wifiName.value = name;
  }

  @override
  void dispose() {
    passwordController.dispose();
    verifyCodeController.dispose();
    super.dispose();
  }
}
