import 'package:get/get.dart';
import 'package:restaurant/pages/Menu_list/index.dart';
import 'package:restaurant/pages/cart/index.dart';
import 'package:restaurant/pages/cart_history/index.dart';
import 'package:restaurant/pages/home/food_details/index.dart';
import 'package:restaurant/pages/home/index.dart';
import 'package:restaurant/pages/home/personal_inforation/index.dart';
import 'package:restaurant/pages/home/product_details/index.dart';
import 'package:restaurant/pages/home/reserve_table/index.dart';

import 'routes.dart';

class AppPages{


  static String getInitial() => AppRoutes.Home;

  static List<GetPage> routes = [
    /*GetPage(
        name: AppRoutes.Sign_In,
        page: () => const SignInPage(),
        binding: SignInBinding(),
    ),*/
    GetPage(
      name: AppRoutes.Home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      /*middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],*/
    ),

    GetPage(
      name: AppRoutes.ProductDetails,
      page: () => const ProductDetailsPage(),
      binding: ProductDetailsBinding(),
    ),

    GetPage(
      name: AppRoutes.Reserve,
      page: () => const ReservePage(),
      binding: ReserveBinding(),
    ),

    GetPage(
      name: AppRoutes.ReserveTable,
      page: () => const ReserveTablePage(),
      binding: ReserveTableBinding(),
    ),

    GetPage(
      name: AppRoutes.Cart,
      page: () => const CartPage(),
      binding: CartBinding(),
    ),

    GetPage(
      name: AppRoutes.CartHistory,
      page: () => const CartHistoryPage(),
      binding: CartHistoryBinding(),
    ),

    GetPage(
      name: AppRoutes.PersonalInformation,
      page: () => const PersonalInformationPage(),
      binding: PersonalInformationBinding(),
    ),

    GetPage(
      name: AppRoutes.MenuList,
      page: () => const MenuListPage(),
      binding: MenuListBinding(),
    ),

    /*GetPage(
      name: AppRoutes.Profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.MainMap,
      page: () => const MainMapPage(),
      binding: MainMapBinding(),
    ),
    GetPage(
      name: AppRoutes.Address,
      page: () {
        AddressPage _addressPage = Get.arguments;
        return _addressPage;
      },
      binding: AddressBinding(),
    ),*/
  ];
}