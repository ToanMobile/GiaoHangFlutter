import 'package:app_giao_hang/app/app_pages.dart';
import 'package:app_giao_hang/data/api/models/device/chart_device.dart';
import 'package:app_giao_hang/data/storage/key_constant.dart';
import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/utils/data_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/api/models/urvega/ChartSampleData.dart';
import '../../../data/api/api_constants.dart';
import '../../../data/api/models/device/device_detail_item.dart';
import '../../../data/api/models/device/device_item.dart';
import '../../../data/api/repositories/device_repository.dart';
import '../../../utils/date_time_utils.dart';
import '../../base/base_controller.dart';
import '../home/home_controller.dart';

class DeviceController extends BaseController {
  final _deviceRepository = Get.find<DeviceRepository>();
  final _homeController = Get.find<HomeController>();
  final DeviceItem? deviceItem = Get.arguments as DeviceItem?;
  final passwordController = TextEditingController();
  final nameDeviceController = TextEditingController();
  final wifiName = ''.obs;
  final dateTimeRangeText = ''.obs;
  final stateControl = false.obs;
  ValueNotifier timerNotifier = ValueNotifier(null);
  var _deviceDetailItem = DeviceDetailItem().obs;
  final dateType = DATE_TYPE.NOW.obs;

  DeviceDetailItem get deviceDetailItem => _deviceDetailItem.value;

  DeviceDetailData? get deviceDetailData => deviceDetailItem.dataList;

  //Chart
  RxList<LineSeries<ChartData, DateTime>> _listChart = RxList<LineSeries<ChartData, DateTime>>();

  List<LineSeries<ChartData, DateTime>> get listChart => _listChart.value;

  /*var chartWaterData = <ChartData>[
    ChartData(DateTime(2019, 5, 1, 7), -15),
    ChartData(DateTime(2019, 5, 1, 8), 5),
    ChartData(DateTime(2019, 5, 1, 9), 4.5),
    ChartData(DateTime(2019, 5, 1, 10), 4.2),
    ChartData(DateTime(2019, 5, 1, 11), 4),
    ChartData(DateTime(2019, 5, 1, 12), 3),
    ChartData(DateTime(2019, 5, 1, 13), 2),
    ChartData(DateTime(2019, 5, 1, 14), 1),
    ChartData(DateTime(2019, 5, 1, 15), 0.5)
  ];

  var chartExampleData = <ChartData>[
    ChartData(DateTime(2019, 5, 1, 7), 22),
    ChartData(DateTime(2019, 5, 1, 8), 23),
    ChartData(DateTime(2019, 5, 1, 9), 24),
    ChartData(DateTime(2019, 5, 1, 10), 27),
    ChartData(DateTime(2019, 5, 1, 11), 28),
    ChartData(DateTime(2019, 5, 1, 12), 30),
    ChartData(DateTime(2019, 5, 1, 13), 32),
    ChartData(DateTime(2019, 5, 1, 14), 34),
    ChartData(DateTime(2019, 5, 1, 15), 33)
  ];
*/
  @override
  void onInit() {
    super.onInit();
    getDeviceDetail();
  }

  Future<void> getDeviceDetail() async {
    if (deviceItem?.serialNo == null || deviceItem?.connecting == false) return;
    print("deviceItem::" + deviceItem.toString());
    if (deviceItem?.isControl == true) {
      stateControl.value = deviceItem?.isOn == true;
      nameDeviceController.text = deviceItem?.name ?? '';
      return;
    }
    try {
      showLoading();
      Stopwatch stopwatch = Stopwatch()..start();
      await _deviceRepository.getDeviceDetail(sn: deviceItem?.serialNo ?? "").then((value) {
        if (value != null) {
          _deviceDetailItem.value = value;
          nameDeviceController.text = deviceDetailItem.name ?? '';
        }
      });
      hideLoading();
      updateDateChart(DATE_TYPE.NOW, isFirst: true);
      stopwatch.stop();
      print('getDeviceDetail:::${stopwatch.elapsed}');
      print("getDeviceDetail:::" + _deviceDetailItem.value.toString());
    } catch (e) {
      hideLoading();
      showMessage(getErrors(e));
    }
  }

  onGotoSettingDevice() {
    Get.toNamed(AppRoutes.SETTING_DEVICE, arguments: deviceItem)?.then((value) {
      print('onGotoSettingDevice=$value');
      nameDeviceController.text = value;
      _deviceDetailItem.value.name = value;
      print('deviceDetailItem=${deviceDetailItem.name}');
    });
  }

  void updateDeviceName(String name) async {
    try {
      if (deviceItem?.serialNo == null) return;
      showLoading();
      await _deviceRepository.updateDevice(sn: deviceItem?.serialNo ?? '', name: name).then((value) {
        nameDeviceController.text = name;
      });
      hideLoading();
    } catch (e) {
      hideLoading();
      showMessage(getErrors(e));
    }
  }

  void updateDateChart(DATE_TYPE date_type, {DateTimeRange? dateTimeRange, bool? isFirst = false}) async {
    if (isFirst == false) {
      Get.back();
    }
    showLoading();
    var dayPickStart = "";
    var dayPickEnd = "";
    switch (date_type) {
      case DATE_TYPE.NOW:
        dayPickStart = formatDate(DateTime.now(), DATE_FORMAT3) ?? "";
        dayPickEnd = dayPickStart;
        print("DATE_TYPE.NOW::start:$dayPickStart end:$dayPickEnd");
        break;
      case DATE_TYPE.LAST:
        DateTime dateTime = DateTime.now();
        dayPickEnd = formatDate(dateTime, DATE_FORMAT3) ?? "";
        dayPickStart = formatDate(dateTime.subtract(Duration(days: 1)), DATE_FORMAT3) ?? "";
        print("DATE_TYPE.LAST::start:$dayPickStart end:$dayPickEnd");
        break;
      case DATE_TYPE.WEEK:
        DateTime dateTime = DateTime.now();
        dayPickStart = formatDate(findFirstDateOfPreviousWeek(dateTime), DATE_FORMAT3) ?? "";
        dayPickEnd = formatDate(findLastDateOfPreviousWeek(dateTime), DATE_FORMAT3) ?? "";
        print("DATE_TYPE.WEEK::start:$dayPickStart end:$dayPickEnd");
        break;
      case DATE_TYPE.RANGE:
        dayPickStart = formatDate(dateTimeRange?.start, DATE_FORMAT3) ?? "";
        dayPickEnd = formatDate(dateTimeRange?.end, DATE_FORMAT3) ?? "";
        dateTimeRangeText.value = "$dayPickStart${textLocalization('common_go')}$dayPickEnd";
        print("DATE_TYPE.RANGE::start:$dayPickStart end:$dayPickEnd");
      default:
        break;
    }
    //List<ChartDevice>? response = await _deviceRepository.getChartDevice(sn: deviceItem?.serialNo ?? "", startTime: dayPickStart, endTime: dayPickEnd);
    List<ChartDevice>? response = await _deviceRepository.getChartLite(deviceItem?.serialNo ?? "");
    if (response != null) {
      List<Map<ChartInfo, List<ChartData>>> listChartLeft = [];
      List<Map<ChartInfo, List<ChartData>>> listChartRight = [];
      for (var i = 0; i < response.length; i++) {
        Map<ChartInfo, List<ChartData>> mapListChart = Map();
        List<ChartData> listChart = [];
        try {
          response[i].dataPoints?.forEach((e) {
            listChart.add(ChartData(DateTime.fromMillisecondsSinceEpoch(e.date ?? DateTime.now().millisecondsSinceEpoch), e.value ?? 0.0));
          });
        } catch (e) {
          print("listChartTotalError::" + e.toString());
        }
        mapListChart.putIfAbsent(ChartInfo(response[i].color?.toColor() ?? color0E66AC, response[i].name ?? "", response[i].unit ?? ""), () => listChart);
        print("listChartTotal::" + mapListChart.toString());
        if (response[i].axisYType == "right") {
          listChartRight.add(mapListChart);
        } else {
          listChartLeft.add(mapListChart);
        }
      }
      _getDefaultLineSeries(listChartLeft, listChartRight);
    }
    hideLoading();
    dateType.value = date_type;
  }

  String getDateTitle() {
    switch (dateType.value) {
      case DATE_TYPE.NOW:
        return textLocalization('home.device.day');
      case DATE_TYPE.LAST:
        return textLocalization('home.device.last.day');
      case DATE_TYPE.WEEK:
        return textLocalization('home.device.week');
      case DATE_TYPE.RANGE:
        return dateTimeRangeText.value;
      default:
        return "";
    }
  }

  void pushDevice(Function(String) errorMessage) async {
    try {
      showLoading();
      await _homeController.pushDevice(deviceItem, deviceItem?.serialNo, isState: (value) {
        print("pushDevice::" + value.toString());
        stateControl.value = value;
      });
      hideLoading();
    } catch (e) {
      hideLoading();
      errorMessage(getErrors(e));
    }
  }

  void removeDevice(Function(String) errorMessage) async {
    showLoading();
    try {
      await _deviceRepository.deleteDevice(sn: deviceItem?.serialNo ?? "");
      hideLoading();
      _homeController.autoRefreshList(isFore: true);
      Get.offAllNamed(AppRoutes.MAIN, arguments: true);
    } catch (e) {
      hideLoading();
      errorMessage(getErrors(e));
    }
  }

  void _getDefaultLineSeries(List<Map<ChartInfo, List<ChartData>>> listDataChartLeft, List<Map<ChartInfo, List<ChartData>>> listDataChartRight) {
    try {
      _listChart.clear();
      listDataChartLeft.forEach((map) {
        map.entries.forEach((element) {
          _listChart.add(
            LineSeries<ChartData, DateTime>(
              animationDuration: 2000,
              dataSource: element.value,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.y,
              width: 2,
              color: element.key.color,
              name: element.key.name,
              markerSettings: const MarkerSettings(isVisible: false),
              dataLabelSettings: DataLabelSettings(
                isVisible: false,
                builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                  return SizedBox(width: 60.ws, height: 20.hs, child: Text('${data.y} ${element.key.unit}', style: text10));
                },
              ),
            ),
          );
        });
      });
      listDataChartRight.forEach((map) {
        map.entries.forEach((element) {
          _listChart.add(
            LineSeries<ChartData, DateTime>(
              animationDuration: 3000,
              dataSource: element.value,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.y,
              width: 2,
              color: element.key.color,
              name: element.key.name,
              markerSettings: const MarkerSettings(isVisible: false),
              dataLabelSettings: DataLabelSettings(
                isVisible: false,
                builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                  return SizedBox(width: 60.ws, height: 20.hs, child: Text('${data.y} ${element.key.unit}', style: text10));
                },
              ),
              yAxisName: 'yAxis',
            ),
          );
        });
      });
    } catch (e) {
      print(e);
    }
  }

  /// Find the first date of the week which contains the provided date.
  DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  /// Find last date of the week which contains provided date.
  DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  /// Find first date of previous week using a date in current week.
  /// [dateTime] A date in current week.
  DateTime findFirstDateOfPreviousWeek(DateTime dateTime) {
    final DateTime sameWeekDayOfLastWeek = dateTime.subtract(const Duration(days: 7));
    return findFirstDateOfTheWeek(sameWeekDayOfLastWeek);
  }

  /// Find last date of previous week using a date in current week.
  /// [dateTime] A date in current week.
  DateTime findLastDateOfPreviousWeek(DateTime dateTime) {
    final DateTime sameWeekDayOfLastWeek = dateTime.subtract(const Duration(days: 7));
    return findLastDateOfTheWeek(sameWeekDayOfLastWeek);
  }

  @override
  void dispose() {
    passwordController.dispose();
    nameDeviceController.dispose();
    _listChart.clear();
    super.dispose();
  }
}
