import 'package:app_giao_hang/ui/main/product/product_controller.dart';
import 'package:app_giao_hang/ui/widgets/base_scaffold_widget.dart';
import 'package:flutter/material.dart';

import '../../base/base_page.dart';

//ignore: must_be_immutable
class ProductPage extends BasePage<ProductController> {
  @override
  Widget buildContentView(BuildContext context, ProductController controller) {
    return ScaffoldBase(
      body: Center(
        child: Text('Empty'),
      ),
    );
  }
}
