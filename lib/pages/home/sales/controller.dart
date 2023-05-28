
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:restaurant/common/apis/apis.dart';
import 'package:restaurant/common/entities/entities.dart';
import 'package:restaurant/pages/cart/index.dart';
import 'package:restaurant/pages/home/sales/index.dart';
import 'package:restaurant/theme.dart';


class SalesController extends GetxController{
  SalesController();
  final state = SalesState();

  PageController pageController = PageController(viewportFraction: 0.85);

  final RefreshController refreshController = RefreshController(
      initialRefresh: true
  );

  void onRefresh(){
    asyncLoadAllData().then((_){
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((_){
      refreshController.refreshFailed();
    });
  }

  void onLoading(){
    asyncLoadAllData().then((_){
      refreshController.loadComplete();
    }).catchError((_){
      refreshController.loadFailed();
    });
  }

  Future<void> getFoodProductList() async{
    Response response = await UserApi.to.getFoodProductsList();
    if(response.statusCode==200){
      state.foodList.value = [];
      state.foodList.addAll(Product.fromJson(response.body).products);
    }else{

    }
  }

  Future<List<ProductModel>> searchProducts()async{

    return state.predictionList;
  }


  Future<void> getRecommendedProductList() async{
    Response response = await UserApi.to.getRecommendedProductsList();
    if(response.statusCode==200){
      state.recommendedProductList.value = [];
      state.recommendedProductList.addAll(Product.fromJson(response.body).products);
    }else{

    }
  }

  asyncLoadAllData() async {
    getFoodProductList();
    getRecommendedProductList();
  }


  @override
  void onInit() {
    super.onInit();

    asyncLoadAllData();
  }

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }
}