
import 'package:get/get.dart';
import 'package:restaurant/common/entities/entities.dart';

class CartHistoryState{
  RxMap<String, CartModel> items = <String, CartModel>{}.obs;

  RxMap<String, int> cartItemsPerOrder = <String, int>{}.obs;

  //  only for storage
  RxList<CartModel> storageItem = <CartModel>[].obs;

  RxInt totalQuantity = 0.obs;

  RxList<CartModel> getItems = <CartModel>[].obs;
}