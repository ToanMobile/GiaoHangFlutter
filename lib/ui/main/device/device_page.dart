import 'package:app_giao_hang/app/app_pages.dart';
import 'package:app_giao_hang/data/storage/key_constant.dart';
import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/widgets/button/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../base/base_page.dart';
import '../../widgets/base_scaffold_widget.dart';
import '../../widgets/default_appbar.dart';
import '../home/widget/chart_water_item_view.dart';
import 'device_controller.dart';

//ignore: must_be_immutable
class DevicePage extends BasePage<DeviceController> {
  @override
  Widget buildContentView(BuildContext context, DeviceController controller) {
    return ScaffoldBase(
      offMarginVertical: true,
      appBar: DefaultAppbar(
        title: textLocalization(controller.deviceItem?.deviceTypeName ?? ''),
        appBarStyle: AppBarStyle.BACK,
        actions: [
          TouchableOpacity(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Assets.icons.icMoreHoriz.svg(),
            ),
            onPressed: () => controller.onGotoSettingDevice(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: buildWidgetRoot(context),
      ),
    );
  }

  buildWidgetRoot(BuildContext context) {
    if (controller.deviceItem?.connecting == true) {
      if (controller.deviceItem?.deviceTypeId == DEVICE_TYPE.AIR.name) {
        return buildWidgetScreenAir(context);
      } else if (controller.deviceItem?.deviceTypeId == DEVICE_TYPE.WATER.name) {
        return buildWidgetScreenWater(context);
      } else if (controller.deviceItem?.deviceTypeId == DEVICE_TYPE.CONTROL.name) {
        if (controller.stateControl.value) {
          return buildWidgetScreenControlOn();
        } else {
          return buildWidgetScreenControlOff();
        }
      }
    } else {
      return buildWidgetScreenError();
    }
  }

  buildWidgetScreenAir(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            controller.nameDeviceController.text,
            style: text14.bold.textColorPrimary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 30.hs),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.ws,
                    height: 60.ws,
                    child: Row(
                      children: [
                        Assets.icons.icThermometer.svg(),
                        SizedBox(width: 20.ws),
                        Text(controller.deviceDetailData?.temperature ?? '', style: text34.textColor141414),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.ws),
                  SizedBox(
                    width: 100.ws,
                    height: 60.ws,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(textLocalization('home.device.air1'), style: text14.textColor141414),
                        Text(controller.deviceDetailData?.humidity ?? "", style: text22.textColor141414),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.ws,
                    height: 60.ws,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(textLocalization('home.device.air2'), style: text14.textColor141414),
                        Text(controller.deviceDetailData?.heatindex ?? "", style: text18.textColor141414),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100.ws,
                    height: 60.ws,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(textLocalization('home.device.light'), style: text14.textColor141414),
                        Text(controller.deviceDetailData?.light ?? "", style: text18.textColor141414),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 12.hs),
          /*TouchableOpacity(
            onPressed: () => openBottomSheet(context),
            child: ContainerBase(
              color: colorPrimary,
              isMargin: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.getDateTitle(), style: text14.textColorWhite),
                  Assets.icons.icCalendar.svg(),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.hs),
          ContainerBase(
            color: colorPrimary,
            isMargin: true,
            height: 76.ws,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(textLocalization('home.device.air.temp.high'), style: text12.textColorWhite),
                    Text(controller.deviceDetailData?.highestTemperature ?? "", style: text22.textColorWhite),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(textLocalization('home.device.air.temp.min'), style: text12.textColorWhite),
                    Text(controller.deviceDetailData?.lowestTemperature ?? "", style: text22.textColorWhite),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10.hs),*/
          buildChartDetail()
        ],
      ),
    );
  }

  buildChartDetail() => SizedBox(
        height: 420.hs,
        child: Stack(
          children: [
            _buildDefaultLineChart(),
            Positioned(
              top: 6.ws,
              right: 6.ws,
              child: TouchableOpacity(
                onPressed: () => Get.toNamed(AppRoutes.DEVICE_CHART_DETAIL),
                child: Assets.icons.icExpand.svg(),
              ),
            ),
          ],
        ),
      );

  buildWidgetScreenWater(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            controller.nameDeviceController.text,
            style: text14.bold.textColorPrimary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 30.hs),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WaterItemView(waterValue: controller.deviceDetailData?.waterLevelValue ?? 0),
              SizedBox(width: 15.ws),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(textLocalization('home.device.water.now'), style: text14.textColor141414),
                  Text(controller.deviceDetailData?.waterLevelText ?? "", style: text22.textColor141414),
                  SizedBox(height: 15.hs),
                  Row(
                    children: [
                      Text("${controller.deviceDetailData?.comparisonText ?? ""} ", style: text14.bold.textColor141414),
                      Text(textLocalization('home.device.water.last2'), style: text14.textColor141414),
                    ],
                  ),
                  Text(controller.deviceDetailData?.comparisonValue ?? "", style: text22.textColor141414),
                ],
              )
            ],
          ),
          SizedBox(height: 12.hs),
          /*TouchableOpacity(
            onPressed: () => openBottomSheet(context),
            child: ContainerBase(
              color: colorPrimary,
              isMargin: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.getDateTitle(), style: text14.textColorWhite),
                  Assets.icons.icCalendar.svg(),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.hs),*/
          buildChartDetail()
        ],
      ),
    );
  }

  buildWidgetScreenControlOn() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            controller.deviceItem?.name ?? '',
            style: text14.bold.textColorPrimary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 60.hs),
          TouchableOpacity(
            onPressed: () => controller.pushDevice((e) => showMessage(e)),
            child: Assets.icons.icButtonOnL.svg(),
          ),
          SizedBox(height: 36.hs),
          Text(textLocalization('home.device.control.on'), style: text14.textColor141414),
        ],
      ),
    );
  }

  buildWidgetScreenControlOff() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            controller.deviceItem?.name ?? '',
            style: text14.bold.textColorPrimary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 60.hs),
          TouchableOpacity(
            onPressed: () => controller.pushDevice((e) => showMessage(e)),
            child: Assets.icons.icButtonOffL.svg(),
          ),
          SizedBox(height: 36.hs),
          Text(textLocalization('home.device.control.off'), style: text14.textColor141414),
        ],
      ),
    );
  }

  buildWidgetScreenError() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 40.hs),
        Assets.icons.icDeviceUnlink.svg(),
        SizedBox(height: 36.hs),
        Text(textLocalization('home.device.error'), style: text14.bold.textColor141414),
        SizedBox(height: 36.hs),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: textLocalization('home.device.error.des1'), style: text14.textColor141414),
              TextSpan(text: textLocalization('home.device.error.des2'), style: text14.textColorPrimary),
              TextSpan(text: textLocalization('home.device.error.des3'), style: text14.textColor141414),
            ],
          ),
        ),
      ],
    );
  }

  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      backgroundColor: colorWhite,
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.only(top: 30.hs, left: 16.ws, right: 16.ws, bottom: 10.hs),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.top,
        padding: 6.ws,
        itemPadding: 10.ws,
        orientation: LegendItemOrientation.vertical,
        textStyle: text10,
        isResponsive: true,
        height: '20%',
        alignment: ChartAlignment.center,
      ),
      primaryXAxis: DateTimeCategoryAxis(
        axisLine: const AxisLine(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
        intervalType: DateTimeIntervalType.auto,
        interval: 10,
        dateFormat: DateFormat.yMMMd(),
        rangePadding: ChartRangePadding.none,
        labelIntersectAction: AxisLabelIntersectAction.rotate45,
        labelRotation: 180,
      ),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}',
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(color: Colors.transparent),
      ),
      axes: <ChartAxis>[
        NumericAxis(
          name: 'yAxis',
          labelFormat: '{value}',
          opposedPosition: true,
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(color: Colors.transparent),
        )
      ],
      series: controller.listChart,
      tooltipBehavior: TooltipBehavior(enable: true),
      onTooltipRender: (TooltipArgs args) {
        List<dynamic>? chartData = args.dataPoints;
        final item = chartData?[args.seriesIndex];
        args.text = '${DateFormat('d MMM yyyy HH:mm:ss').format(item.x)}\n${item.y}';
      },
    );
  }

  //PopUp pick date chart
  void openBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.hs),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.ws, vertical: 12.hs),
            child: Text(
              textLocalization('home.device.date'),
              style: text14.bold.textColor141414,
            ),
          ),
          TouchableOpacity(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.ws, vertical: 12.hs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textLocalization('home.device.day'),
                    style: text14.textColor141414,
                  ),
                  controller.dateType.value == DATE_TYPE.NOW ? Icon(Icons.check, size: 16) : SizedBox()
                ],
              ),
            ),
            onPressed: () => controller.updateDateChart(DATE_TYPE.NOW),
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),
          TouchableOpacity(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.ws, vertical: 12.hs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textLocalization('home.device.last.day'),
                    style: text14.textColor141414,
                  ),
                  controller.dateType.value == DATE_TYPE.LAST ? Icon(Icons.check, size: 16) : SizedBox()
                ],
              ),
            ),
            onPressed: () => controller.updateDateChart(DATE_TYPE.LAST),
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),
          TouchableOpacity(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.ws, vertical: 12.hs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textLocalization('home.device.week'),
                    style: text14.textColor141414,
                  ),
                  controller.dateType.value == DATE_TYPE.WEEK ? Icon(Icons.check, size: 16) : SizedBox()
                ],
              ),
            ),
            onPressed: () => controller.updateDateChart(DATE_TYPE.WEEK),
          ),
          Divider(height: 1, thickness: 0.5, color: color929394),
          TouchableOpacity(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.ws, vertical: 12.hs),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textLocalization('home.device.range.date'),
                      style: text14.textColor141414,
                    ),
                    controller.dateType.value == DATE_TYPE.RANGE ? Icon(Icons.check, size: 16) : SizedBox()
                  ],
                ),
              ),
              onPressed: () {
                pickDateRange(context);
              }),
          SizedBox(height: 10),
        ],
      ),
      backgroundColor: colorWhite,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }

  void pickDateRange(BuildContext context) async {
    DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );
    if (result != null) {
      controller.updateDateChart(DATE_TYPE.RANGE, dateTimeRange: result);
    }
  }
}
