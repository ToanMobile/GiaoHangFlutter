import 'package:flutter/widgets.dart';

import '../../../../data/api/models/response/cabinet/cabinet_model.dart';
import '../../../../res/style.dart';
import '../../../widgets/button/touchable_opacity.dart';

class CabinetItemView extends StatelessWidget {
  final CabinetModel item;
  final VoidCallback onPressed;

  CabinetItemView({
    required this.item,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      child: Container(
        height: 150.ws,
        padding: EdgeInsets.only(right: 10.ws, top: 8.ws, bottom: 8.ws),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120.ws,
                      child: Text('ID: ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    Text(item.checkerId.toString(), style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120.ws,
                      child: Text('Người kiểm tủ: ', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    Expanded(
                      child: Text(item.checkerName ?? '', style: text16.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
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
                    Text('Chưa kiểm', style: text14.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text((item.chuaKiemTra ?? 0).toString(), style: text16.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Column(
                  children: [
                    Text('Đã lấy', style: text14.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text((item.dangKiemTra ?? 0).toString(), style: text16.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Column(
                  children: [
                    Text('Hoàn thành', style: text14.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text((item.hoanTat ?? 0).toString(), style: text16.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
              ],
            ),
            Text('Ghi chú', style: text14.medium.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
            Text(item.checkingSession ?? '', style: text16.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 2),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
