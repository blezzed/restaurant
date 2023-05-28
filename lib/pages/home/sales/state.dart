
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/common/entities/entities.dart';

class SalesState{
  //RxList<QueryDocumentSnapshot<ProductItem>> productList = <QueryDocumentSnapshot<ProductItem>>[].obs;



  RxList<ProductModel> predictionList = <ProductModel>[].obs;

  RxList<ProductModel> foodList = <ProductModel>[].obs;

  RxInt quantity = 0.obs;

  RxList<ProductModel> recommendedProductList = <ProductModel>[].obs;
}