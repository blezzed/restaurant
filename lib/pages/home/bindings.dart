
import 'package:get/get.dart';
import 'package:restaurant/pages/cart_history/index.dart';
import 'package:restaurant/pages/home/index.dart';
import 'package:restaurant/pages/home/sales/index.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SalesController>(() => SalesController());
    Get.lazyPut<CartHistoryController>(() => CartHistoryController());
  }

}