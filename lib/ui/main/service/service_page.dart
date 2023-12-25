import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/ui/widgets/base_scaffold_widget.dart';
import 'package:app_giao_hang/ui/widgets/button/touchable_opacity.dart';
import 'package:flutter/material.dart';

import '../../base/base_page.dart';
import '../../widgets/default_appbar.dart';
import '../widget/empty_item_view.dart';
import 'service_controller.dart';

//ignore: must_be_immutable
class ServicePage extends BasePage<ServiceController> {
  @override
  Widget buildContentView(BuildContext context, ServiceController controller) {
    return ScaffoldBase(
      appBar: DefaultAppbar(title: textLocalization('service_title'), appBarStyle: AppBarStyle.NONE),
      body: Column(
        children: [
          SizedBox(height: 100.hs),
          buildWidgetService(context),
          EmptyItemView(padding: 14.ws),
        ],
      ),
    );
  }

  buildWidgetService(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(textLocalization('home_list_device').toUpperCase(), style: text14.height20Per.textColor141414),
        ),
        TouchableOpacity(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Assets.icons.icDeviceAdd.svg(width: 14.ws, height: 14.ws),
          ),
          onPressed: () => controller.onGotoAddDevice(),
        )
      ],
    );
  }
}
