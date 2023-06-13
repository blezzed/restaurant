
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:restaurant/pages/cart_history/index.dart';
=======
>>>>>>> origin/main
import 'package:restaurant/pages/home/index.dart';
import 'package:restaurant/pages/home/sales/index.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SalesController>(() => SalesController());
<<<<<<< HEAD
    Get.lazyPut<CartHistoryController>(() => CartHistoryController());
=======
>>>>>>> origin/main
  }

}