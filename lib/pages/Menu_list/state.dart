import 'package:get/get.dart';
import 'package:restaurant/common/entities/entities.dart';

class MenuListState{

  RxList<MenuModel> menuList = <MenuModel>[].obs;

  RxInt quantity = 0.obs;

  RxInt totalSelected = 0.obs;

}