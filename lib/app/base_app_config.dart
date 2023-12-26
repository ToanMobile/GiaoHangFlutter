import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data/api/repositories/device_repository.dart';
import '../data/api/repositories/order_repository.dart';
import '../data/api/repositories/user_repository.dart';
import '../data/api/services/device_service.dart';
import '../data/api/services/order_service.dart';
import '../data/api/services/user_service.dart';
//import '../libraries/photo_manager/photo_provider.dart';

setupLocator() async {
  //Setup service
  Get.lazyPut<UserService>(() => UserService(), fenix: true);
  Get.lazyPut<OrderService>(() => OrderService(), fenix: true);
  Get.lazyPut<DeviceService>(() => DeviceService(), fenix: true);

  //Setup repositories
  Get.lazyPut<UserRepository>(() => UserRepository(), fenix: true);
  Get.lazyPut<DeviceRepository>(() => DeviceRepository(), fenix: true);
  Get.lazyPut<OrderRepository>(() => OrderRepository(), fenix: true);

  // Get.put(AssetPathProvider());
  //
  // Get.put(PhotoProvider());
  // Get.put(AssetPathProvider());
}

setupStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
