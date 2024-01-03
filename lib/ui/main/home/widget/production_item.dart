import 'package:app_giao_hang/data/api/models/response/order/order_detail_model.dart';
import 'package:app_giao_hang/res/style.dart';
import 'package:app_giao_hang/utils/currency_format.dart';
import 'package:flutter/material.dart';

import '../../../widgets/image_widget.dart';

class ProductionItem extends StatelessWidget {
  const ProductionItem({super.key, this.onTap, required this.item});

  final Productorder item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100.ws,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RoundNetworkImage(
              width: 100.ws,
              height: 60.ws,
              url: item.image ?? "",
            ),
            SizedBox(width: 20.ws),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Tên: ${item.name ?? ''}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.ts,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    "Loại: Tủ",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.ts,
                    ),
                  ),
                  Text(
                    "SL: ${(item.quantity ?? 0).toString()}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.ts,
                    ),
                  ),
                  Text(
                    "Giá: ${((item.price ?? 0).toString()).stringToVNCurrency()} ₫",
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
