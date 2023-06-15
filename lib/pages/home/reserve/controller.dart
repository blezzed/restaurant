import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/common/entities/entities.dart';
import 'package:restaurant/common/store/store.dart';
import 'package:restaurant/common/widget/widget.dart';
import 'package:restaurant/pages/cart/index.dart';
import 'package:restaurant/pages/home/product_details/index.dart';
import 'package:restaurant/pages/home/reserve/index.dart';

class ReserveController extends GetxController{
  ReserveController();
  final state = ReserveState();
  final user_id = UserStore.to.profile.id;
  String? doc_uid;
  String? page;

  CartController _cart = Get.find();

  /*int state.quantity.value = 0;
  int get quantity => state.quantity.value;*/

  int get inCartItems => state.inCartItems.value+state.quantity.value;

  void setQuantity(bool isIncrement){
    if(isIncrement){

      state.quantity.value = checkQuantity(state.quantity.value + 1);
    }else{
      state.quantity.value = checkQuantity(state.quantity.value - 1);
    }
    update();
  }

  int checkQuantity(int quantity){
    if((state.inCartItems.value+quantity)<0){
      showCustomSnackBar("you can't reduce more !", title: "Item count", isError: false);

      if(state.inCartItems.value>0){
        state.quantity.value =-state.inCartItems.value;
        return state.quantity.value;
      }
      return 0;
    }else if((state.inCartItems.value+quantity)>50){
      //TODO change the maximum number of items add in cart in product details controller
      showCustomSnackBar("you can't add more !", title: "Item count", isError: false);
      return 50;
    }else{
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart){
    state.quantity.value =0;
    state.inCartItems.value=0;
    _cart=cart;
    var exist=false;
    exist = _cart.existInCart(product);
    // if exist
    if(exist){
      state.inCartItems.value =_cart.getQuantity(product);
    }
    // get from storage
  }

  void addItem(context, ProductModel product){
    _cart.addItem(context, product, state.quantity.value);
    state.quantity.value=0;
    state.inCartItems.value=_cart.getQuantity(product);

    update();
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }

  @override
  void onInit(){
    super.onInit();
    inCartItems;
    var data = Get.parameters;
    page = data["page"];

    state.product.value = ProductModel.fromJson(jsonDecode(data["product"]!));

  }

}