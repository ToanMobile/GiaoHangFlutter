import 'package:app_giao_hang/data/api/models/response/delivery/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../res/style.dart';
import '../../../widgets/button/touchable_opacity.dart';

class DeliveryCarItemView extends StatelessWidget {
  final CarModel item;
  final VoidCallback onPressed;

  DeliveryCarItemView({
    required this.item,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      child: Container(
        height: 160.ws,
        padding: EdgeInsets.only(right: 10.ws, top: 8.ws, bottom: 8.ws),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.ws,
                      child: Text('STT: ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    Text(item.id.toString(), style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.ws,
                      child: Text('TênXe: ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    Expanded(
                      child: Text(item.vehiclename ?? '', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.ws,
                      child: Text('Biển số: ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    Text(item.licenseplate ?? '', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
