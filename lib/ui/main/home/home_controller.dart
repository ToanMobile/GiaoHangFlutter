// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:app_giao_hang/data/api/models/device/device_item.dart';
import 'package:app_giao_hang/data/api/repositories/device_repository.dart';
import 'package:app_giao_hang/data/storage/key_constant.dart';
import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../app/app_controller.dart';
import '../../../app/app_pages.dart';
import '../../../data/api/models/ChartSampleData.dart';
import '../../../data/api/models/TUser.dart';
import '../../../data/api/models/don_hang_item.dart';
import '../../base/base_controller.dart';
import '../../widgets/dialogs/app_popup.dart';

class HomeController extends BaseController {
  final _mainController = Get.find<MainController>();
  final _deviceRepository = Get.find<DeviceRepository>();
  final _appController = Get.find<AppController>();
  var _user = TUser().obs;

  TUser get user => _user.value;
  final GlobalKey widgetKey = GlobalKey();

  List<DeviceItem> get listDevice => _listDevice$.value;
  final _listDevice$ = <DeviceItem>[].obs;
  Timer? periodicTimer = null;

  bool get isShowScreenError => false;

  RxList<LineSeries<ChartData, DateTime>> _listChart = RxList<LineSeries<ChartData, DateTime>>();

  List<LineSeries<ChartData, DateTime>> get listChart => _listChart.value;

  List<DonHangModel> get listDon => _listDon$.value;
  final _listDon$ = <DonHangModel>[].obs;

  var chartMonthNowData = <ChartData>[
    ChartData(DateTime(2023, 5, 1, 7), -15),
    ChartData(DateTime(2023, 5, 1, 8), 5),
    ChartData(DateTime(2023, 5, 1, 9), 4.5),
    ChartData(DateTime(2023, 5, 1, 10), 4.2),
    ChartData(DateTime(2023, 5, 1, 11), 4),
    ChartData(DateTime(2023, 5, 1, 12), 3),
    ChartData(DateTime(2023, 5, 1, 13), 2),
    ChartData(DateTime(2023, 5, 1, 14), 1),
    ChartData(DateTime(2023, 5, 1, 15), 0.5)
  ];

  var chartMonthPassData = <ChartData>[
    ChartData(DateTime(2023, 1, 1, 1), -15),
    ChartData(DateTime(2023, 2, 1, 5), 15),
    ChartData(DateTime(2023, 3, 2, 12), 4.5),
    ChartData(DateTime(2023, 4, 3, 5), 4.2),
    ChartData(DateTime(2023, 5, 3, 8), 14),
    ChartData(DateTime(2023, 6, 3, 13), 3),
    ChartData(DateTime(2023, 7, 3, 23), 12),
    ChartData(DateTime(2023, 8, 4, 18), 11),
    ChartData(DateTime(2023, 10, 4), 2.5)
  ];

  @override
  void onClose() {
    print('HomeController:onClose');
    super.onClose();
  }

  @override
  void onInit() async {
    super.onInit();
    _user.value = _appController.user ?? TUser(name: 'Văn Toàn', gender: SEX_TYPE.MEN.name, phone: '');
    //autoRefreshList();
    initChart();
    initDonHang();
  }

  void initDonHang() {
    _listDon$.add(DonHangModel('Mới', 1));
    _listDon$.add(DonHangModel('Đã gửi vận chuyển', 4));
    _listDon$.add(DonHangModel('Thành công', 3));
    _listDon$.add(DonHangModel('Thất bại', 0));
    _listDon$.add(DonHangModel('Đã huỷ', 1));
  }

  void initChart() {
    _listChart.addAll(getDefaultLineSeries(chartMonthNowData));
    _listChart.addAll(getDefaultLastLineSeries(chartMonthPassData));
  }

  List<LineSeries<ChartData, DateTime>> getDefaultLineSeries(List<ChartData> listChart) {
    return <LineSeries<ChartData, DateTime>>[
      LineSeries<ChartData, DateTime>(
        animationDuration: 2500,
        dataSource: listChart,
        xValueMapper: (ChartData sales, _) => sales.x as DateTime,
        yValueMapper: (ChartData sales, _) => sales.y,
        width: 2,
        name: 'Tháng này',
        markerSettings: const MarkerSettings(isVisible: false),
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    ];
  }

  List<LineSeries<ChartData, DateTime>> getDefaultLastLineSeries(List<ChartData> listChart) {
    return <LineSeries<ChartData, DateTime>>[
      LineSeries<ChartData, DateTime>(
        animationDuration: 2500,
        dataSource: listChart,
        xValueMapper: (ChartData sales, _) => sales.x as DateTime,
        yValueMapper: (ChartData sales, _) => sales.y,
        width: 2,
        name: 'Tháng trước',
        markerSettings: const MarkerSettings(isVisible: false),
        dataLabelSettings: DataLabelSettings(isVisible: true),
        yAxisName: 'yAxis',
      ),
    ];
  }

  void autoRefreshList({bool isFore = false}) async {
    print('HomeController:autoRefreshList:' + _mainController.pageIndex.value.toString());
    if (_mainController.pageIndex.value == 0 || isFore) {
      await getListDevice();
      periodicTimer?.cancel();
      periodicTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
        periodicTimer = timer;
        await getListDevice(isShowLoading: false);
      });
    }
  }

  MainController get getMainController => _mainController;

  Future<void> getListDevice({bool? isShowLoading = true}) async {
    try {
      if (AppPopup.pairDevice) return;
      if (isShowLoading == true) {
        showLoading();
      }
      await _deviceRepository.getListDevice(_mainController.farmPick).then((value) {
        if (value != null) {
          _listDevice$.value = value;
          Logger(
                  printer: PrettyPrinter(
                      methodCount: 2,
                      // Number of method calls to be displayed
                      errorMethodCount: 8,
                      // Number of method calls if stacktrace is provided
                      lineLength: 120,
                      // Width of the output
                      colors: true,
                      // Colorful log messages
                      printEmojis: true,
                      // Print an emoji for each log message
                      printTime: true // Should each log print contain a timestamp
                      ))
              .i("getListDevice::");
        }
      });
      if (isShowLoading == true) {
        hideLoading();
      }
    } catch (e) {
      if (isShowLoading == true) {
        hideLoading();
      }
      showMessage(getErrors(e), isForeShow: isShowLoading == true);
    }
  }

  Future<void> pushDevice(DeviceItem? deviceItem, String? sn, {Function(bool)? isState}) async {
    try {
      if (sn == null || deviceItem == null) return isState != null ? isState(false) : null;
      showLoading();
      await _deviceRepository.pushDevice(sn: sn).then((value) {
        if (value != null) {
          if (value.state == true) {
            isState != null ? isState(true) : null;
            final deviceUpdate = deviceItem.copyWith(data: CONTROL_TYPE.ON.name);
            listDevice[listDevice.indexWhere((element) => element.serialNo == sn)] = deviceUpdate;
          } else if (value.state == false) {
            isState != null ? isState(false) : null;
            final deviceUpdate = deviceItem.copyWith(data: CONTROL_TYPE.OFF.name);
            listDevice[listDevice.indexWhere((element) => element.serialNo == sn)] = deviceUpdate;
          }
          _listDevice$.value = listDevice;
        } else {
          isState != null ? isState(false) : null;
          showMessage(textLocalization('data.error'));
        }
      });
      hideLoading();
    } catch (e) {
      isState != null ? isState(false) : null;
      hideLoading();
      showMessage(getErrors(e));
    }
  }

  void updateName(String nameUpdate) {
    _user.update((_user) {
      user.updateUser(name: nameUpdate);
    });
    print('updateName:::' + user.name.toString());
  }

  onGotoAddDevice() {
    periodicTimer?.cancel();
    Get.toNamed(AppRoutes.ADD_DEVICE);
  }

  onGotoManagerDevice(DeviceItem deviceItem) {
    periodicTimer?.cancel();
    removePopUp();
    Get.toNamed(AppRoutes.MANAGER_DEVICE, arguments: deviceItem);
  }

  removePopUp() {
    _mainController.appPopup?.removePopup();
  }

  getPopup() => _mainController.appPopup;

  @override
  void dispose() {
    periodicTimer?.cancel();
    super.dispose();
  }
}
