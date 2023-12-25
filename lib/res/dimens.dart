import 'dart:math';

import 'package:get/get.dart';

// Default guideline sizes are based on standard ~5" screen mobile device
const guidelineBaseWidth = 390;
const guidelineBaseHeight = 844;

late double scaleWidth = 0;

late double scaleHeight = 0;

late double scaleText = 0;

void initScreenSize() {
  scaleWidth = Get.width / guidelineBaseWidth;
  scaleHeight = Get.height / guidelineBaseHeight;
  scaleText = min(scaleWidth, scaleHeight);
}

extension ScreenExtension on num {
  double get ws => this * scaleWidth; // Width Scale
  double get hs => this * scaleHeight; // Height Scale
  double get ts => this * scaleText; // Text Scale
  double get rs => this * scaleText; // Radius Scale
}
