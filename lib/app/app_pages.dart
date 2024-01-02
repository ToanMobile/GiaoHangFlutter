import 'package:app_giao_hang/ui/main/home/home_detail_binding.dart';
import 'package:get/get.dart';

import '../../ui/auth/login/login_binding.dart';
import '../../ui/auth/login/login_page.dart';
import '../../ui/main/main_binding.dart';
import '../../ui/main/main_page.dart';
import '../../ui/notification/list_notification_binding.dart';
import '../../ui/notification/list_notification_page.dart';
import '../ui/auth/register/register_binding.dart';
import '../ui/auth/register/register_page.dart';
import '../ui/main/home/home_detail_page.dart';
import '../ui/splash/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    /* GetPage(
      name: AppRoutes.UPDATE_PROFILE,
      page: () => UpdateProfilePage(),
      binding: BindingBuilderCallback(() {
        Get.put(UpdateProfileController());
      }),
    ),*/
    GetPage(
      name: AppRoutes.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.MAIN_DETAIL,
      page: () => HomeDetailPage(),
      binding: HomeDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.LIST_NOTIFICATION,
      page: () => ListNotificationPage(),
      binding: ListNotificationBinding(),
    ),
  ];
}
