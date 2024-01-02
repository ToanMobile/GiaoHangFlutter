import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/main/cabinet/cabinet_controller.dart';
import 'package:app_giao_hang/ui/widgets/base_scaffold_widget.dart';
import 'package:flutter/material.dart';

import '../../base/base_page.dart';
import '../../widgets/default_appbar.dart';
import 'widget/cabinet_item_view.dart';

//ignore: must_be_immutable
class CabinetPage extends BasePage<CabinetController> {
  @override
  Widget buildContentView(BuildContext context, CabinetController controller) {
    return Scaffold(
      appBar: DefaultAppbar(title: 'Danh sách kiểm tủ', appBarStyle: AppBarStyle.NONE),
      body: buildWidgetListData(),
    );
  }

  buildWidgetListData() => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: colorWhite,
        ),
        child: ListView.separated(
          itemBuilder: (context, index) => Container(
            color: colorWhite,
            padding: EdgeInsets.symmetric(horizontal: 26.ws),
            child: CabinetItemView(
              item: controller.listData[index],
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
          itemCount: controller.listData.length,
        ),
      );
}
