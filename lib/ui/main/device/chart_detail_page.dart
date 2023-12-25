import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/widgets/button/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../base/base_page.dart';
import 'device_controller.dart';

//ignore: must_be_immutable
class ChartDetailPage extends BasePage<DeviceController> {
  @override
  Widget buildContentView(BuildContext context, DeviceController controller) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      body: buildChartDetail(),
    );
  }

  buildChartDetail() => RotatedBox(
        quarterTurns: 1,
        child: Container(
          color: colorWhite,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TouchableOpacity(
                  onPressed: () {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 21.ws,
                      height: 21.ws,
                      child: Assets.icons.icClosed.svg(),
                    ),
                  ),
                ),
              ),
              _buildDefaultLineChart(),
            ],
          ),
        ),
      );

  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      backgroundColor: colorWhite,
      plotAreaBorderWidth: 0,
      legend: Legend(
        isVisible: true,
        position: LegendPosition.top,
        padding: 10.ws,
        itemPadding: 10.ws,
        isResponsive: true,
        textStyle: text16,
        overflowMode: LegendItemOverflowMode.wrap,
        orientation: LegendItemOrientation.vertical,
      ),
      primaryXAxis: DateTimeCategoryAxis(
        axisLine: const AxisLine(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
        intervalType: DateTimeIntervalType.auto,
        interval: 8,
        dateFormat: DateFormat.yMMMd(),
        rangePadding: ChartRangePadding.none,
        labelIntersectAction: AxisLabelIntersectAction.rotate90,
        labelRotation: 300,
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
    );
  }
}
