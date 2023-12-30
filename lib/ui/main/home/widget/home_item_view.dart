import 'package:flutter/widgets.dart';

import '../../../../data/api/models/response/order/list_order_model.dart';
import '../../../../res/style.dart';
import '../../../widgets/button/touchable_opacity.dart';

class HomeItemView extends StatelessWidget {
  final ListOrderModel item;
  final VoidCallback onPressed;

  HomeItemView({
    required this.item,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      child: Container(
        height: 130.ws,
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
                      child: Text('ID: ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    Text(item.deliveryid.toString(), style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.ws,
                      child: Text('Người giao: ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    Expanded(
                      child: Text(item.shipname ?? '', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Tổng đơn', style: text14.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text((item.total ?? 0).toString(), style: text16.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Column(
                  children: [
                    Text('Chờ lấy', style: text14.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text((item.choLayHang ?? 0).toString(), style: text16.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Column(
                  children: [
                    Text('Đã lấy', style: text14.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text((item.daLayHang ?? 0).toString(), style: text16.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Column(
                  children: [
                    Text('Đang giao', style: text14.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text((item.dangGiaoHang ?? 0).toString(), style: text16.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Column(
                  children: [
                    Text('Hoàn thành', style: text14.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text((item.hoanTat ?? 0).toString(), style: text16.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
