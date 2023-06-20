import 'package:get/get.dart';

class ReserveTableState{
  RxInt currentStep = 0.obs;

  RxBool menuCheckbox = true.obs;

  RxString selected_date = "Select date of the meal".obs;

  RxString selected_time = "Select time of the meal".obs;

}