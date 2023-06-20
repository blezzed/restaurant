
import 'package:get/get.dart';
import 'package:restaurant/pages/Menu_list/index.dart';

class MenuListBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MenuListController>(() => MenuListController());
  }

}