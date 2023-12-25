import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';

class ScaffoldBase extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final bool? offMarginVertical;

  ScaffoldBase({Key? key, required this.body, this.appBar, this.offMarginVertical, this.bottomNavigationBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: Material(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.hs, vertical: offMarginVertical == true ? 10.hs : 30.ws),
            child: body,
          ),
        ),
      ),
    );
  }
}
