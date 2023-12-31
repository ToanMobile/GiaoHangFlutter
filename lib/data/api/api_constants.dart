const DATE_TIME_FORMAT = "yyyy-MM-ddTHH:mm:ssZ";
const DATE_TIME_FORMAT2 = "dd/MM/yyyy HH:mm";
const DATE_FORMAT = "dd/MM/yyyy";
const DATE_FORMAT2 = "dd-MM-yyyy";
const DATE_FORMAT3 = "yyyy-MM-dd";
const DATE_OF_WEEK_FORMAT = "EEE, dd/MM";
const TIME_FORMAT = "HH:mm";
final minDate = DateTime(1900, 1, 1, 0, 0, 0);
final maxDate = DateTime(3000, 1, 1, 0, 0, 0);
const MIN_YEAR_OLD_USED_APP = 18;
const PAGE_SIZE = 30;
//Stg
const BASE_URL_DEV = "https://ibp-staging.tastycounter.vn/";
const UPLOAD_PHOTO_URL_DEV = BASE_URL_DEV + "cms/api/product/img/";

void DOWNLOAD_PHOTO_URL_DEV(String name) => "$BASE_URL_DEV/common/files/$name?subfolder=contract";

//Production
const BASE_URL_PROD = "https://ibp.tastycounter.vn/"; // production
const UPLOAD_PHOTO_URL_PROD = BASE_URL_PROD + "product/img/"; //production
void DOWNLOAD_PHOTO_URL_PROD(String name) => "$BASE_URL_PROD/common/files/$name?subfolder=contract";
var isConnection = true;

String PHOTO_URL_CDN = UPLOAD_PHOTO_URL_DEV;
//Login
const LOGIN_BY_EMAIL = "app/api/identity/login";
const LOGIN_BY_SOCIAL = "app/api/identity/login-with-partner";
//Get user
const GET_PROFILE = "app/api/customer/get-customer";
//Get List Order
const GET_LIST_ORDER_DELIVERY_OLD = "app/api/order/delivery";
const GET_LIST_ORDER_DELIVERY = "app/api/order/get-delivery?page=1&limit=100";
const GET_DETAIL_ORDER = "cms/api/order/get-delivery-detail?page=1&limit=100&orderID=&";
//Get list cabinet
const GET_LIST_CABINET = "cms/api/customer/get-hscheck?page=1&limit=100";
//Get list delivery
const GET_LIST_DELIVERY_PER = "cms/api/customer/get-user-info?page=1&limit=100&type=1";
const GET_LIST_DELIVERY_CAR = "cms/api/customer/get-vehicles?page=1&limit=100&type=1";
const UPDATE_DELIVERY_PER = "cms/api/customer/update-userinfo";
const UPDATE_DELIVERY_CAR = "cms/api/customer/update-vehicle";
const ADD_DELIVERY_PER = "cms/api/customer/insert-userinfo";
const ADD_DELIVERY_CAR = "cms/api/customer/insert-vehicle";

//OLD
//Register
const REGISTER = "auth/register";
//OTP
const VERIFY_OTP = "code/check";
const REQUEST_OTP = "code/generate";
//Profile
const UPDATE_PROFILE = "profile/update";

// firebase
const PUSH_DEVICE_TOKEN = "/v1/app/device/%s";

//Farm
const GET_ALL_FARM = "farm/all";
const GET_FARM = "farm/one";
const CREATE_FARM = "farm/add";
const UPDATE_FARM = "farm/update";
const REGION_PROVINCE = "region/province";
const REGION_DISTRICT = "region/district";
const REGION_WARD = "region/ward";

//Device
const GET_ALL_DEVICE = "device/all";
const GET_DEVICE = "device/one";
const UPDATE_DEVICE = "device/update";
const PAIR_DEVICE = "pair";
const VERIFY_DEVICE = "device/verify";
const PUSH_DEVICE = "device/push";
const DELETE_DEVICE = "device/remove";
const CHART_DEVICE = "device/chart";
