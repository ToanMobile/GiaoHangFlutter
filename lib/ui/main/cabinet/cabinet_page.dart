import 'package:app_giao_hang/ui/main/cabinet/cabinet_controller.dart';
import 'package:app_giao_hang/ui/widgets/base_scaffold_widget.dart';
import 'package:flutter/material.dart';

import '../../base/base_page.dart';

//ignore: must_be_immutable
class CabinetPage extends BasePage<CabinetController> {
  @override
  Widget buildContentView(BuildContext context, CabinetController controller) {
    return ScaffoldBase(
      body: Center(
        child: Text('Empty'),
      ),
    );
  }
}
