
import 'package:get/get.dart';
import 'package:restaurant/pages/cart/index.dart';
import 'package:restaurant/pages/home/product_details/index.dart';

class ProductDetailsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());

  }

}