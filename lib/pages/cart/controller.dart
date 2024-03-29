import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/common/entities/entities.dart';
import 'package:restaurant/common/store/store.dart';
import 'package:restaurant/pages/cart/index.dart';
import 'package:restaurant/pages/cart_history/index.dart';
import 'package:restaurant/theme.dart';

class CartController extends GetxController{
  CartController();
  final state = CartState();
  final user_id = UserStore.to.profile.id;


  void addItem(context, ProductModel product, int quantity){
    var totalQuantity=0;
    if(state.items.containsKey(product.id!)){
      state.items.update(product.id!, (val) {

        totalQuantity=val.quantity.value+quantity;

        return CartModel(
          id: val.id,
          quantity: val.quantity+ quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if(totalQuantity<=0){
        state.items.remove(product.id);
      }
    }else{
      if(quantity>0){
        state.items.putIfAbsent(product.id!, () => CartModel(
          id: product.id,
          quantity: quantity.obs,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        ));
      }else{
        Get.snackbar("Item count", "You should atleast add an item in the cart !",
          backgroundColor: Theme.of(context).primaryColor,
          colorText: Colors.white,
        );
      }
    }
    UserStore.to.saveToCartList(getItems);
    getCartData();
  }

  bool existInCart(ProductModel product){
    if(state.items.containsKey(product.id)){
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product){
    var quantity=0;
    if(state.items.containsKey(product.id)){
      state.items.forEach((key, value) {
        if(key==product.id){
          quantity = value.quantity.value;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity=0;
    state.items.forEach((key, value){
      totalQuantity += value.quantity.value;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems{
    return state.items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount{
    var total=0;

    state.items.forEach((key, value) { total += value.quantity.value * value.product!.price!;});
    return total;
  }

  List<CartModel> getCartData(){
    setCart = UserStore.to.getCartList();

    state.getItems.value = state.items.values.map((e) {
      return e;
    }).toList();

    return state.storageItem;
  }

  set setCart(List<CartModel> items){
    state.storageItem.value = items;

    for(int i=0; i<state.storageItem.length; i++){
      state.items.putIfAbsent(state.storageItem[i].product!.id!, () => state.storageItem[i]);
    }
  }

  void addToHistory(){
    UserStore.to.saveToCartHistory(state.getItems);
    clear();
  }

  void clear(){
    state.items.value={};
    removeCartSharedPreferences();
    update();
  }

  List<CartModel> getCartHistoryList(){
    return UserStore.to.getCartHistoryList();
  }

  set setItems(Map<String, CartModel> setItems){
    state.items.value ={};
    //state.items = setItems;
  }

  void addToCartList(){
    UserStore.to.saveToCartList(getItems);
    update();
  }

  void removeCartSharedPreferences() {
    UserStore.to.removeCart();
  }

  @override
  void onInit(){
    super.onInit();
    var data = Get.arguments;
    //removeCartSharedPreferences();
    getCartData();

    /*state.getItems.value = state.items.values.map((e) {
      return e;
    }).toList();*/

    /*for(int i=0; i<state.storageItem.length; i++){
      if(state.cartItemsPerOrder.containsKey(company_name)){
        state.cartItemsPerOrder.update(company_name, (value) => ++value);
      }else{
        state.cartItemsPerOrder.putIfAbsent(company_name, () => 1);
      }
    }*/
  }
}