import 'package:get/get.dart';

import '../../ui/auth/login/login_binding.dart';
import '../../ui/auth/login/login_page.dart';
import '../../ui/main/main_binding.dart';
import '../../ui/main/main_page.dart';
import '../../ui/notification/list_notification_binding.dart';
import '../../ui/notification/list_notification_page.dart';
import '../ui/auth/register/register_binding.dart';
import '../ui/auth/register/register_page.dart';
import '../ui/main/device/add/add_device_binding.dart';
import '../ui/main/device/add/add_device_page.dart';
import '../ui/main/device/chart_detail_page.dart';
import '../ui/main/device/device_binding.dart';
import '../ui/main/device/device_page.dart';
import '../ui/main/device/device_settings_page.dart';
import '../ui/main/manager/manager_binding.dart';
import '../ui/main/manager/manager_list_binding.dart';
import '../ui/main/manager/manager_list_page.dart';
import '../ui/main/manager/manager_page.dart';
import '../ui/main/manager/manager_search_binding.dart';
import '../ui/main/manager/manager_search_page.dart';
import '../ui/main/manager/manager_size_page.dart';
import '../ui/main/settings/screen/security_binding.dart';
import '../ui/main/settings/screen/security_email_page.dart';
import '../ui/main/settings/screen/security_link_page.dart';
import '../ui/main/settings/screen/security_page.dart';
import '../ui/main/settings/screen/setting_notification_page.dart';
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
      name: AppRoutes.LIST_NOTIFICATION,
      page: () => ListNotificationPage(),
      binding: ListNotificationBinding(),
    ),
    /*HOME*/
    GetPage(
      name: AppRoutes.ADD_DEVICE,
      page: () => AddDevicePage(),
      binding: AddDeviceBinding(),
    ),
    GetPage(
      name: AppRoutes.MANAGER_DEVICE,
      page: () => DevicePage(),
      binding: DeviceBinding(),
      children: [
        GetPage(
          name: AppRoutes.CHART_DETAIL,
          page: () => ChartDetailPage(),
        ),
      ],
    ),
    GetPage(
      name: AppRoutes.SETTING_DEVICE,
      page: () => DeviceSettingsPage(),
      binding: DeviceBinding(),
    ),
    /*SERVICE*/
    GetPage(
      name: AppRoutes.MANAGER_LIST_DEVICE,
      page: () => ManagerListPage(),
      binding: ManagerListBinding(),
    ),
    GetPage(
      name: AppRoutes.MANAGER,
      page: () => ManagerPage(),
      binding: ManagerBinding(),
    ),
    GetPage(
      name: AppRoutes.MANAGER_SEARCH_LOCATION,
      page: () => ManagerSearchPage(),
      binding: ManagerSearchBinding(),
    ),
    GetPage(
      name: AppRoutes.MANAGER_SIZE,
      page: () => ManagerSizePage(),
      binding: ManagerBinding(),
    ),
    /*SETTING*/
    GetPage(
      name: AppRoutes.SECURITY,
      page: () => SecurityPage(),
      binding: SecurityBinding(),
    ),
    GetPage(
      name: AppRoutes.SECURITY_EMAIL,
      page: () => SecurityEmailPage(),
      binding: SecurityBinding(),
    ),
    GetPage(
      name: AppRoutes.SECURITY_LINK,
      page: () => SecurityLinkPage(),
      binding: SecurityBinding(),
    ),
    GetPage(
      name: AppRoutes.SETTING_NOTIFICATION,
      page: () => SettingNotificationPage(),
      binding: SecurityBinding(),
    ),
    /*GetPage(
      name: AppRoutes.DISCOVER_MORE,
      page: () => DiscoverMorePage(),
      binding: DiscoverMoreBinding(),
    ),
    GetPage(
        name: AppRoutes.LIST_PROMOTION,
        page: () => ListPromotionPage(),
        binding: ListPromotionBinding()),
    GetPage(
        name: AppRoutes.PLACES,
        page: () => PlacesPage(),
        binding: PlacesBinding()),
    GetPage(
        name: AppRoutes.OPTION_BOOKING,
        page: () => OptionBookingPage(),
        binding: OptionBookingBinding()),
    GetPage(
        name: AppRoutes.INFO_PAYMENT,
        page: () => InfoPaymentPage(),
        binding: InfoPaymentBinding()),*/

    /*GetPage(
        name: AppRoutes.DISCOVER_SEARCH,
        page: () => DiscoverSearchPage(),
        binding: DiscoverSearchBinding()),
    GetPage(
        name: AppRoutes.DISCOVER_DETAIL,
        page: () => DiscoverDetailPage(),
        binding: DiscoverDetailBinding()),
    GetPage(
        name: AppRoutes.MEDICAL,
        page: () => MedicalPage(),
        binding: MedicalBinding()),
    GetPage(
        name: AppRoutes.PLACE_DETAIL,
        page: () => PlaceDetailPage(),
        binding: PlaceDetailBinding()),

    GetPage(
        name: AppRoutes.MY_CART,
        page: () => CartPage(),
        fullscreenDialog: true,
        binding: BindingsBuilder(() {
          Get.lazyPut<CartController>(() => CartController());
        })),
    GetPage(
        name: AppRoutes.POST_COMMENT,
        page: () => CommentPage(),
        fullscreenDialog: true,
        binding: BindingsBuilder(() {
          Get.put(CommentController());
        })),
    GetPage(
        name: AppRoutes.HOTEL,
        page: () => HotelPage(),
        binding: BindingsBuilder(() {
          Get.put(HotelController());
          Get.put(FindHotelInfoController());
        })),
    GetPage(
        name: AppRoutes.TOPIC_DISCOVER,
        page: () => TopicDiscoverPage(),
        binding: BindingsBuilder(() {
          Get.put(TopicDiscoverController());
        })),
    GetPage(
        name: AppRoutes.HOTEL_DETAIL,
        page: () => HotelDetailPage(),
        binding: BindingsBuilder(() {
          Get.put(HotelDetailController());
        })),
    GetPage(
        name: AppRoutes.SEARCH_PLACE,
        page: () => SearchPlacePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<SearchPlaceController>(() => SearchPlaceController());
        })),
    GetPage(
        name: AppRoutes.CHOOSE_DATE_RANGE,
        page: () => ChooseDateRangePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<ChooseDateRangeController>(
              () => ChooseDateRangeController());
        })),
    GetPage(
        name: AppRoutes.HOTEL_UTILITIES,
        page: () => HotelUtilitiesPage(),
        fullscreenDialog: true,
        binding: BindingsBuilder(() {
          Get.put(HotelUtilitiesController());
        })),
    GetPage(
        name: AppRoutes.ROOM_UTILITIES,
        page: () => RoomUtilitiesPage(),
        fullscreenDialog: true,
        binding: BindingsBuilder(() {
          Get.put(RoomUtilitiesController());
        })),
    GetPage(
        name: AppRoutes.FIND_ROOM_INFO,
        page: () => FindRoomInfoPage(),
        fullscreenDialog: true,
        binding: BindingsBuilder(() {
          Get.lazyPut<FindRoomInfoController>(() => FindRoomInfoController(),
              fenix: true);
        })),
    GetPage(
        name: AppRoutes.BOOKING,
        page: () => BookingPage(),
        binding: BindingsBuilder(() {
          Get.put(BookingController());
        })),
    GetPage(
        name: AppRoutes.FIND_ROOM_RESULT,
        page: () => FindHotelResultPage(),
        binding: BindingsBuilder(() {
          Get.put(FindHotelResultController());
        })),
    GetPage(
        name: AppRoutes.FILTER_HOTEL_INFO,
        page: () => FilterHotelInfoPage(),
        binding: BindingsBuilder(() {
          Get.put(FilterHotelInfoController());
        })),
    GetPage(
        name: AppRoutes.HOTEL_VIEW_MORE,
        page: () => ViewMorePage(),
        binding: BindingsBuilder(() {
          Get.put(ViewMoreController());
        })),*/
  ];
}
