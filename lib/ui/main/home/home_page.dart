import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/widgets/button/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../res/theme/theme_service.dart';
import '../../base/base_page.dart';
import '../manager/widget/manager_item_view.dart';
import 'home_controller.dart';

//ignore: must_be_immutable
class HomePage extends BasePage<HomeController> {
  @override
  Widget buildContentView(BuildContext context, HomeController controller) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              buildWidgetUserInfo(context),
              SizedBox(height: 10.ws),
              buildWidgetTotal(context),
              SizedBox(height: 10.ws),
              buildWidgetChart(),
              SizedBox(height: 10.ws),
              buildWidgetDonHang(),
              SizedBox(height: 10.ws),
              buildWidgetNguonDonHang(),
            ],
          ),
        ),
      ),
    );
  }

  buildWidgetUserInfo(BuildContext context) => Container(
        width: double.infinity,
        height: 130.ws,
        decoration: BoxDecoration(
          color: getColor().bgThemeColorWhite,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0.5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.ws),
            Container(
              height: 50.ws,
              width: double.infinity,
              padding: EdgeInsets.only(left: 24.ws),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "${textLocalization("home.user.title")}${controller.user.name != null ? controller.user.name : ""}",
                        style: text26.medium.textColor141414.height14Per,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Visibility(
                      visible: false,
                      child: TouchableOpacity(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.ws),
                          child: Assets.icons.icNotification.svg(),
                        ),
                        onPressed: () {
                          showMessage(textLocalization('feature'));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50.ws,
              width: double.infinity,
              padding: EdgeInsets.only(left: 24.ws),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.ws),
                    child: Text(controller.getMainController.nameFarmPick.value.isNotEmpty ? controller.getMainController.nameFarmPick.value : 'Farm của tôi',
                        style: text14.textColor141414),
                  ),
                  TouchableOpacity(
                    child: Padding(
                      key: controller.widgetKey,
                      padding: EdgeInsets.symmetric(horizontal: 24.ws, vertical: 4.ws),
                      child: Assets.icons.icMenu.svg(height: 24.ws, width: 20.ws),
                    ),
                    onPressed: () {
                      final RenderBox renderBox = controller.widgetKey.currentContext?.findRenderObject() as RenderBox;
                      final Offset offset = renderBox.localToGlobal(Offset.zero);
                      controller.getPopup()?.showPopupDialog(context, offset);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      );

  buildWidgetTotal(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.ws,
      child: Wrap(
        spacing: 10.ws,
        children: [
          Container(
            color: colorEBEBEC,
            width: 80.ws,
            height: 70.ws,
            child: Column(
              children: [
                Text('Doanh thu', style: text14.textColor777777),
                Text('10', style: text14.bold.textColor141414),
              ],
            ),
          ),
          Container(
            color: colorEBEBEC,
            width: 80.ws,
            height: 70.ws,
            child: Column(
              children: [
                Text('Bán lẻ', style: text14.textColor777777),
                Text('20', style: text14.bold.textColor141414),
              ],
            ),
          ),
          Container(
            color: colorEBEBEC,
            width: 80.ws,
            height: 70.ws,
            child: Column(
              children: [
                Text('Đơn hàng', style: text14.textColor777777),
                Text('3', style: text14.bold.textColor141414),
              ],
            ),
          ),
          Container(
            color: colorEBEBEC,
            width: 80.ws,
            height: 70.ws,
            child: Column(
              children: [
                Text('Tồn kho', style: text14.textColor777777),
                Text('0', style: text14.bold.textColor141414),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildWidgetChart() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: colorWhite,
      ),
      child: SfCartesianChart(
        backgroundColor: colorWhite,
        plotAreaBorderWidth: 0,
        title: ChartTitle(text: 'Biểu đồ doanh thu'),
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          padding: 10.ws,
          itemPadding: 10.ws,
          isResponsive: true,
          textStyle: text16,
          overflowMode: LegendItemOverflowMode.wrap,
          orientation: LegendItemOrientation.horizontal,
        ),
        primaryXAxis: DateTimeCategoryAxis(
          axisLine: const AxisLine(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
          intervalType: DateTimeIntervalType.auto,
          interval: 1,
          dateFormat: DateFormat.Hm(),
          rangePadding: ChartRangePadding.none,
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
      ),
    );
  }

  buildWidgetDonHang() => Container(
        width: double.infinity,
        height: 210.ws,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: colorWhite,
        ),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
            color: colorWhite,
            padding: EdgeInsets.symmetric(horizontal: 26.ws),
            child: ManagerItemView(
              title: controller.listDon[index].name,
              content: controller.listDon[index].total.toString(),
              onPressed: () {},
            ),
          ),
          shrinkWrap: true,
          separatorBuilder: (context, index) => Divider(
            indent: 24,
            endIndent: 24,
            height: 1,
            thickness: 0.5,
            color: color929394,
          ),
          itemCount: controller.listDon.length,
        ),
      );

  buildWidgetNguonDonHang() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: colorWhite,
        ),
        padding: EdgeInsets.all(16),
        width: double.infinity,
        height: 100.ws,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nguồn đơn hàng', style: text16.bold.textColor141414),
            Center(child: Text('Không có dữ liệu', style: text16.textColor141414)),
          ],
        ),
      );
}
