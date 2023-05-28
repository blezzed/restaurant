
import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant/common/entities/entities.dart';
import 'package:restaurant/common/routes/routes.dart';
import 'package:restaurant/common/services/services.dart';
import 'package:restaurant/common/values/storage.dart';

class UserStore extends GetxController{
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  bool get isLogin => _isLogin.value;
  set setIsLogin(login)=>_isLogin.value=login;

  String token = "";
  bool get hasToken => token.isNotEmpty;

  final _profile = UserData().obs;
  UserData get profile => _profile.value;

  List<String> cart=[];
  List<String> cartHistory=[];
  List items=[];

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    var profileOffline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    if(profileOffline.isNotEmpty){
      _isLogin.value = true;
      _profile(UserData.fromJson(jsonDecode(profileOffline)));
      //removeCart();
      //removeCartSharedPreferences();
      getCartList();
      getCartHistoryList();
    }

  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
  }

  Future<String> getProfile() async {
    if(token.isEmpty) return "";
    return StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
  }

  Future<void> saveProfile(UserData profile) async {
    _isLogin.value = true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
    _profile(profile);
    setToken(profile.access_token!);
  }

  Future<void> saveToCartList(List<CartModel> cartList) async {
    var time = DateTime.now().toString();
    cart=[];
    items=[];
    // convert objects to string
    for (var e in cartList) {
      e.time = time;
      var item = {
        "name": "${e.name}",
        "quantity": e.quantity,
        "price": '${e.price}',
        "currency": "USD"
      };
      items.add(item);
      cart.add(jsonEncode(e));
    }
    StorageService.to.setList(STORAGE_USER_CART_LIST_KEY, cart);
  }

  List<CartModel> getCartList()  {
    List<String> carts=[];
    carts = StorageService.to.getList(STORAGE_USER_CART_LIST_KEY);
    List<CartModel> cartList=[];

    for (var element in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }

    return cartList;
  }

  List<CartModel> getCartHistoryList(){
    cartHistory=[];
    List<CartModel> cartListHistory=[];

    cartHistory = StorageService.to.getList(STORAGE_USER_CART_HISTORY_LIST_KEY);
    for (var element in cartHistory) {
      cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    }
    return cartListHistory;
  }

  void saveToCartHistory(List<CartModel> itemList){
    var time = DateTime.now().toString();
    List<String> _items=[];

    // convert objects to string
    for (var e in itemList) {
      e.time = time;
      _items.add(jsonEncode(e));
    }

    cartHistory = StorageService.to.getList(STORAGE_USER_CART_HISTORY_LIST_KEY);
    for(int i=0; i<_items.length; i++){
      cartHistory.add(cart[i]);
    }
    _items=[];
    StorageService.to.setList(STORAGE_USER_CART_HISTORY_LIST_KEY, cartHistory);
  }

  void removeCart(){
    cart=[];
    StorageService.to.remove(STORAGE_USER_CART_LIST_KEY);
  }

  void removeCartHistory(){
    StorageService.to.remove(STORAGE_USER_CART_HISTORY_LIST_KEY);
  }

  void removeCartSharedPreferences(){
    StorageService.to.remove(STORAGE_USER_CART_LIST_KEY);
    StorageService.to.remove(STORAGE_USER_CART_HISTORY_LIST_KEY);
  }

  Future<void> onLogout() async {
    await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
    await StorageService.to.remove(STORAGE_USER_PROFILE_KEY);
    await StorageService.to.remove(STORAGE_USER_CART_LIST_KEY);
    await StorageService.to.remove(STORAGE_USER_CART_HISTORY_LIST_KEY);
    _isLogin.value = false;
    token = "";
    Get.offAllNamed(AppRoutes.Sign_In);
  }

}