import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';

import '../../../res/theme/theme_service.dart';

class DataEmptyWidget extends StatelessWidget {
  final Color? background;

  DataEmptyWidget({this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: background ?? getColor().bgThemeColorWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            DImages.icEmpty,
            width: 120,
            height: 120,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            textLocalization('data.empty'),
            style: text16.textColor141414,
          )
        ],
      ),
    );
  }
}
