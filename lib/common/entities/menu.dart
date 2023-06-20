
import 'package:get/get.dart';
import 'package:restaurant/common/entities/entities.dart';

class MenuModel {
  ProductModel? product;
  RxInt quantity = 0.obs;
  RxBool isSelected = false.obs;

  MenuModel(
      {
        this.product,
        required this.quantity,
        required this.isSelected
      });

  MenuModel.fromJson(Map<String, dynamic> json) {
    product = ProductModel.fromJson(json["product"]);
    quantity = json["quantity"];
    isSelected = json["isSelected"];
  }

  Map<String, dynamic> toJson(){
    return {
      "product":this.product!.toJson(),
      "quantity": this.quantity,
      "isSelected": this.isSelected,
    };
  }
}
