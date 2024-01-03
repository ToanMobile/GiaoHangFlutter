import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';

mixin CommonTabBar {
  static PreferredSize build(
    BuildContext context, {
    required List<Widget> tabs,
    TabController? controller,
    TextStyle? textStyle,
    bool isScrollable = false,
  }) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, kToolbarHeight),
      child: Container(
        width: double.infinity,
        color: colorBackground,
        padding: EdgeInsets.symmetric(horizontal: 8.ws, vertical: 8.ws),
        child: SizedBox(
          height: 35.ws,
          child: Center(
            child: TabBar(
              controller: controller,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(40.rs)),
              ),
              dividerColor: Colors.transparent,
              labelColor: Theme.of(context).textTheme.bodyMedium?.color,
              labelStyle: textStyle ?? TextStyle(fontSize: 12.ts, fontWeight: FontWeight.bold),
              unselectedLabelStyle: textStyle ?? TextStyle(fontSize: 12.ts, fontWeight: FontWeight.bold),
              unselectedLabelColor: Theme.of(context).colorScheme.secondary,
              isScrollable: isScrollable,
              tabs: tabs,
            ),
          ),
        ),
      ),
    );
  }
}
