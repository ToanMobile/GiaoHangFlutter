import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/utils/currency_format.dart';
import 'package:flutter/material.dart';

import '../../../../data/api/models/response/order/item_model.dart';
import '../../../widgets/image_widget.dart';

class WineItem extends StatelessWidget {
  const WineItem({super.key, this.onTap, required this.item});

  final SlotsModel item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100.ws,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RoundNetworkImage(
              width: 60.ws,
              height: 60.ws,
              url: item.item?.img ?? '',
            ),
            SizedBox(width: 20.ws),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Tên: ${item.item?.name ?? ''}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.ts,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    "Loại: Chai",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.ts,
                    ),
                  ),
                  Text(
                    "SL: ${(item.item?.sl ?? 0).toString()}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.ts,
                    ),
                  ),
                  Text(
                    "Giá: ${((item.item?.price ?? 0).toString()).stringToVNCurrency()} ₫",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.ts,
                      color: color0EAC71,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
