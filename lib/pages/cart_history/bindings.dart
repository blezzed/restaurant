
import 'package:get/get.dart';
import 'package:restaurant/pages/cart_history/index.dart';

class CartHistoryBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartHistoryController>(() => CartHistoryController());
  }

}