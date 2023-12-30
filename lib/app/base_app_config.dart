import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data/api/repositories/cabinet_repository.dart';
import '../data/api/repositories/delivery_repository.dart';
import '../data/api/repositories/order_repository.dart';
import '../data/api/repositories/user_repository.dart';
import '../data/api/services/cabinet_service.dart';
import '../data/api/services/delivery_service.dart';
import '../data/api/services/order_service.dart';
import '../data/api/services/user_service.dart';
//import '../libraries/photo_manager/photo_provider.dart';

setupLocator() async {
  //Setup service
  Get.lazyPut<UserService>(() => UserService(), fenix: true);
  Get.lazyPut<OrderService>(() => OrderService(), fenix: true);
  Get.lazyPut<CabinetService>(() => CabinetService(), fenix: true);
  Get.lazyPut<DeliveryService>(() => DeliveryService(), fenix: true);

  //Setup repositories
  Get.lazyPut<UserRepository>(() => UserRepository(), fenix: true);
  Get.lazyPut<CabinetRepository>(() => CabinetRepository(), fenix: true);
  Get.lazyPut<OrderRepository>(() => OrderRepository(), fenix: true);
  Get.lazyPut<DeliveryRepository>(() => DeliveryRepository(), fenix: true);
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
