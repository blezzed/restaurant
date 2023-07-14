import 'package:get/get.dart';
import 'package:restaurant/pages/cart/index.dart';
import 'package:restaurant/pages/cart_history/index.dart';

class CartBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }

}