import 'dart:async';
import 'dart:io';

import 'package:app_giao_hang/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../app/app_controller.dart';
import '../app/base_app_config.dart';
import '../utils/http_overrides.dart';
import 'flavors.dart';

FutureOr<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put<AppController>(AppController()).init(F.appFlavor ?? Flavor.prod);
  setupStatusBar();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MainApp()));
}