
import 'package:get/get.dart';
import 'package:restaurant/pages/home/personal_inforation/index.dart';

class PersonalInformationBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PersonalInformationController>(() => PersonalInformationController());
  }

}