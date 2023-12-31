import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/main/home/widget/production_item.dart';
import 'package:app_giao_hang/ui/main/home/widget/wine_item.dart';
import 'package:flutter/material.dart';

import '../../../res/theme/theme_service.dart';
import '../../base/base_page.dart';
import '../../widgets/default_appbar.dart';
import 'home_detail_controller.dart';

//ignore: must_be_immutable
class HomeDetailPage extends BasePage<HomeDetailsController> {
  @override
  Widget buildContentView(BuildContext context, HomeDetailsController controller) {
    return Scaffold(
      appBar: DefaultAppbar(title: 'Chi tiết biên bản bàn giao', appBarStyle: AppBarStyle.BACK),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              buildWidgetUserInfo(context),
              SizedBox(height: 10.ws),
              if ((controller.orderDetail.productorder?.length ?? 0) > 0) ...[
                ProductionItem(
                  item: controller.orderDetail.productorder![0],
                  onTap: () {},
                ),
              ],
              SizedBox(height: 10.ws),
              buildWidgetDetails(),
            ],
          ),
        ),
      ),
    );
  }

  buildWidgetUserInfo(BuildContext context) => Container(
        width: double.infinity,
        height: 100.ws,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: getColor().bgThemeColorWhite,
          borderRadius: BorderRadius.all(Radius.circular(14)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0.5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Mã biên bản:",
                      style: text12.medium.textColor141414.height14Per,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      controller.orderDetail.shipping?.deliveryid ?? '',
                      style: text14.medium.textColor141414.height14Per,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: 10.ws),
                Row(
                  children: [
                    Text(
                      "Tên người vận chuyển:",
                      style: text12.medium.textColor141414.height14Per,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      controller.orderDetail.shipping?.shipname ?? '',
                      style: text14.medium.textColor141414.height14Per,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 10.ws),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Số đơn:",
                      style: text12.medium.textColor141414.height14Per,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      (controller.orderDetail.productorder?.length ?? 0).toString(),
                      style: text14.medium.textColor141414.height14Per,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: 10.ws),
                Row(
                  children: [
                    Text(
                      "Ghi chú:",
                      style: text12.medium.textColor141414.height14Per,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      controller.orderDetail.shipping?.note ?? '',
                      style: text14.medium.textColor141414.height14Per,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );

  buildWidgetDetails() => Container(
        width: double.infinity,
        height: 700.ws,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: colorWhite,
        ),
        child: ListView.separated(
          itemBuilder: (context, index) => Container(
            color: colorWhite,
            padding: EdgeInsets.symmetric(horizontal: 26.ws),
            child: WineItem(
              item: controller.listModel[index],
              onTap: () {},
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
          itemCount: controller.listModel.length,
        ),
      );
}
