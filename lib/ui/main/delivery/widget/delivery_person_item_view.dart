import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../data/api/models/response/delivery/delivery_model.dart';
import '../../../../res/style.dart';
import '../../../widgets/button/touchable_opacity.dart';

class DeliveryPersonItemView extends StatelessWidget {
  final DeliveryModel item;
  final VoidCallback onPressed;

  DeliveryPersonItemView({
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
                      child: Text('Tên: ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    Expanded(
                      child: Text(item.fullname ?? '', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.ws,
                      child: Text('SDT: ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    Text(item.phone ?? '', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.ws,
                      child: Text('CCCD: ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    Text(item.cccd ?? '', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.ws,
                      child: Text('Địa chỉ: ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    Text(item.address ?? '', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.ws,
                      child: Text('Giới tính: ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    Text(item.gender == 0 ? 'Nam' : 'Nữ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
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
