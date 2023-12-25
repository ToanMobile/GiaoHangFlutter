import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';

import '../../base/base_page.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/dialogs/app_popup.dart';
import 'manager_list_controller.dart';
import 'widget/manager_item_view.dart';

//ignore: must_be_immutable
class ManagerListPage extends BasePage<ManagerListController> {
  @override
  Widget buildContentView(BuildContext context, ManagerListController controller) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: textLocalization('home.device.manager.farm'),
        appBarStyle: AppBarStyle.BACK,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: controller.updateListFarm.value ? buildListFarm(context) : buildListFarm(context),
      ),
    );
  }

  Widget buildListFarm(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Container(
        color: colorWhite,
        padding: EdgeInsets.symmetric(horizontal: 26.ws),
        child: ManagerItemView(
          title: AppPopup.listFarm?[index].name ?? '',
          content: AppPopup.listFarm?[index].address,
          onPressed: () => controller.onGotoManagerUpdateFarm(
            AppPopup.listFarm?[index],
          ),
        ),
      ),
      separatorBuilder: (context, index) => Divider(
        indent: 24,
        endIndent: 24,
        height: 1,
        thickness: 0.5,
        color: color929394,
      ),
      itemCount: AppPopup.listFarm?.length ?? 0,
    );
  }
}
