import 'package:get/get.dart';
import 'package:restaurant/pages/home/sales/index.dart';

class SalesBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SalesController>(() => SalesController());
  }

}