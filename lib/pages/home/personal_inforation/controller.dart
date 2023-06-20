
import 'package:get/get.dart';
import 'package:restaurant/common/store/store.dart';
import 'package:restaurant/pages/home/personal_inforation/index.dart';

class PersonalInformationController extends GetxController{
  PersonalInformationController();
  final state = PersonalInformationState();
  final user_id = UserStore.to.profile.id;

  @override
  void onInit(){
    super.onInit();

  }

}