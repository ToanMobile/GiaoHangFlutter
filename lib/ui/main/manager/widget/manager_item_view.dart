import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/widgets.dart';

import '../../../widgets/button/touchable_opacity.dart';

class ManagerItemView extends StatelessWidget {
  final String title;
  final String? content;
  final VoidCallback onPressed;

  ManagerItemView({
    this.content,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      child: Container(
        height: 40.ws,
        width: double.infinity,
        padding: EdgeInsets.only(right: 10.ws),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: text14.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
            Text(content ?? '', style: text14.textColor141414, maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
