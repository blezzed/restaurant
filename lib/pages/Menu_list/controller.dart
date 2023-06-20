
import 'package:get/get.dart';
import 'package:restaurant/common/apis/apis.dart';
import 'package:restaurant/common/entities/entities.dart';
import 'package:restaurant/common/store/store.dart';
import 'package:restaurant/pages/Menu_list/index.dart';

class MenuListController extends GetxController{
  MenuListController();
  final state = MenuListState();
  final user_id = UserStore.to.profile.id;

  get totalSelected{
    state.totalSelected.value = state.menuList.where((p) => p.isSelected.value == true).length;
  }

  get addQuantity{
    state.quantity.value += 1;
  }

  get removeQuantity{
    if (state.quantity.value <= 0){
      state.quantity.value -= 1;
    }
  }

  Future<void> getFoodProductList() async{
    Response response = await UserApi.to.getFoodProductsList();
    if(response.statusCode==200){
      for (var v in Product.fromJson(response.body).products) {
        MenuModel meal = MenuModel(
            product : v,
            quantity: 0.obs,
            isSelected : false.obs,
        );
        state.menuList.add(meal);
      }
    }else{

    }
  }

  Future<void> getRecommendedProductList() async{
    Response response = await UserApi.to.getRecommendedProductsList();
    if(response.statusCode==200){
      for (var v in Product.fromJson(response.body).products) {
        MenuModel meal = MenuModel(
          product : v,
          quantity: 0.obs,
          isSelected: false.obs
        );
        state.menuList.add(meal);
      }
    }else{

    }
  }

  asyncLoadAllData() async {
    state.menuList.value = [];
    getFoodProductList();
    getRecommendedProductList();
  }


  @override
  void onInit() {
    super.onInit();
    print("we are in the synce all menu data");
    asyncLoadAllData();
    print(state.menuList);
  }

}