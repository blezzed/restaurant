import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:restaurant/common/apis/apis.dart';
import 'package:restaurant/common/entities/entities.dart';

class FoodApi{
  //static FoodApi get to => Get.find();

  FoodApi();

  Client client = http.Client();
  List<ProductModel> foods = [];

  Future<List<ProductModel>> getFood() async {
    foods = [];
    List response = jsonDecode((await client.get(FoodUrls().retrieveUrl())).body);
    for (var e in response) {
       foods.add(ProductModel.fromJson(e));
    }
    return foods;
  }

  void deleteFood(int id) {
    client.delete(FoodUrls().deleteUrl(id));
    getFood();
  }


}