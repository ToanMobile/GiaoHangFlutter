import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';

import '../../../res/theme/theme_service.dart';

class DataErrorWidget extends StatelessWidget {
  final String? messageError;
  final Function() onReloadData;

  DataErrorWidget({
    this.messageError,
    required this.onReloadData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: getColor().bgThemeColorWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            DImages.dataError,
            width: 90,
            height: 90,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            messageError ?? textLocalization('data.error'),
            style: text16.textColor141414,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => onReloadData(),
            child: Text("Tải lại"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30),
            ),
          )
        ],
      ),
    );
  }
}
