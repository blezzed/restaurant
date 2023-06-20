
import 'package:get/get.dart';
import 'package:restaurant/pages/home/reserve_table/index.dart';

class ReserveTableBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReserveTableController>(() => ReserveTableController());
  }

}