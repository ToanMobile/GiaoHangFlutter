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
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: const BoxDecoration(
            // border: Border(
            //   bottom: BorderSide(
            //     color: AppColor.grey3,
            //     width: 1.0,
            //   ),
            // ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: RoundNetworkImage(
                      width: 200.ws,
                      height: 200.ws,
                      url: item.image ?? "",
                    ),
                  ),
                ],
              ),
            ),
            // CommonNetworkImage(
            //   item.image ?? "",
            //   width: 75,
            //   height: 120,
            // ),
            Text(
              textAlign: TextAlign.center,
              item.name ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
            Text(
              "${((item.price ?? 0).toString()).stringToVNCurrency()} ₫",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.lightGreenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
