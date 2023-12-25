import 'package:flutter/widgets.dart';

import '../../../../res/style.dart';
import '../../../widgets/button/touchable_opacity.dart';

class ManagerItemView extends StatelessWidget {
  final String title;
  final String? content;
  final bool isIconNext;
  final VoidCallback onPressed;

  ManagerItemView({
    this.content,
    this.isIconNext = false,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      child: Container(
        height: 65.ws,
        padding: EdgeInsets.only(right: 10.ws, top: 8.ws, bottom: 8.ws),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: text14.textColor141414, overflow: TextOverflow.ellipsis, maxLines: 1),
                  if (content != null) ...[
                    Text(content ?? '', style: text14.textColorB2B2B2, maxLines: 2, overflow: TextOverflow.ellipsis),
                    SizedBox(width: 6.ws),
                  ],
                ],
              ),
            ),
            if (isIconNext) ...[
              Assets.icons.icSettingsNext.svg(width: 8.ws),
            ]
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
