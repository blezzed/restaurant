import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:restaurant/common/entities/entities.dart';
import 'package:restaurant/common/store/store.dart';
import 'package:restaurant/pages/cart_history/index.dart';

class CartHistoryController extends GetxController{
  CartHistoryController();
  final state = CartHistoryState();
  final user_id = UserStore.to.profile.id;

  List<int> get cartItemsPerOrderToList{
  return state.cartItemsPerOrder.entries.map((e) => e.value).toList().obs;
  }

  List<String> get cartOrderTimeToList{
  return state.cartItemsPerOrder.entries.map((e) => e.key).toList();
  }

  List<CartModel> get getItems{
    return state.items.values.map((e) {
      return e;
    }).toList();
  }

  List<CartModel> getCartHistoryData(){
    setCartHistory = UserStore.to.getCartHistoryList().reversed.toList();
    return state.storageItem;
  }

  set setCartHistory(List<CartModel> items){
    state.storageItem.value = items;
    for(int i=0; i<state.storageItem.length; i++){
      state.items.putIfAbsent(state.storageItem[i].time!, () => state.storageItem[i]);
    }
  }

  asyncLoadAllData() async {
    getCartHistoryData();
    state.getItems.value = [];
    state.cartItemsPerOrder = <String, int>{}.obs;

    state.getItems.value = state.items.values.map((e) {
      return e;
    }).toList();

    for(int i=0; i<state.storageItem.length; i++){
      if(state.cartItemsPerOrder.containsKey(state.storageItem[i].time)){
        state.cartItemsPerOrder.update(state.storageItem[i].time!, (value) => ++value);
      }else{
        state.cartItemsPerOrder.putIfAbsent(state.storageItem[i].time!, () => 1);
      }
    }
  }

  onDismissed(){
    print("i have been clicked");
  }

  clearAllHistory(){
    state.items.value = <String, CartModel>{}.obs;
    state.getItems.value = [];
    state.cartItemsPerOrder = <String, int>{}.obs;
    return UserStore.to.removeCartHistory();
  }

  @override
  void onInit(){
    super.onInit();
    getCartHistoryData();

    state.getItems.value = state.items.values.map((e) {
      return e;
    }).toList();

    for(int i=0; i<state.storageItem.length; i++){
      if(state.cartItemsPerOrder.containsKey(state.storageItem[i].time)){
        state.cartItemsPerOrder.update(state.storageItem[i].time!, (value) => ++value);
      }else{
        state.cartItemsPerOrder.putIfAbsent(state.storageItem[i].time!, () => 1);
      }
    }

  }


}