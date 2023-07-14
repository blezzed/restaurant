import 'package:get/get.dart';
import 'package:restaurant/pages/receipts/index.dart';
import 'package:restaurant/pages/sign_in/index.dart';

class ReceiptsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReceiptsController>(() => ReceiptsController());
  }

}