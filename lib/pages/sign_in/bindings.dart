import 'package:get/get.dart';
import 'package:restaurant/pages/sign_in/index.dart';

class SignInBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }

}