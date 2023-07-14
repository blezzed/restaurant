
import 'package:get/get.dart';
import 'package:restaurant/common/entities/entities.dart';

class CartModel {
  int? id;
  RxInt quantity= 0.obs;
  bool? isExist;
  String? time;
  ProductModel? product;

  CartModel(
      {this.id,
        required this.quantity,
        this.isExist,
        this.time,
        this.product,
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity.value = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    product = ProductModel.fromJson(json["product"]);
  }

  Map<String, dynamic> toJson(){
    return {
      "id":this.id,
      "quantity":this.quantity!.value,
      "isExist":this.isExist,
      "time":this.time,
      "product":this.product!.toJson(),
    };
  }
}
