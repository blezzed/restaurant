
import 'package:get/get.dart';
import 'package:restaurant/common/entities/entities.dart';

class ReserveState{
  final product =  Rx<ProductModel?>(null);

  RxList<ProductModel> foodList = <ProductModel>[].obs;

  RxInt quantity = 0.obs;

  RxInt inCartItems = 0.obs;

  RxBool delivery = true.obs;

}