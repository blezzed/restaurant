
import 'package:get/get.dart';
import 'package:restaurant/pages/cart/index.dart';
import 'package:restaurant/pages/home/product_details/index.dart';
import 'package:restaurant/pages/home/reserve/index.dart';

class ReserveBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<ReserveController>(() => ReserveController());

  }

}