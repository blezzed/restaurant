
import 'package:get/get.dart';
import 'package:restaurant/pages/cart/index.dart';
import 'package:restaurant/pages/home/food_details/index.dart';

class ReserveBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<ReserveController>(() => ReserveController());

  }

}