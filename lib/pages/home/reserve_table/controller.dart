
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/common/store/store.dart';
import 'package:restaurant/pages/home/reserve_table/index.dart';

class ReserveTableController extends GetxController{
  ReserveTableController();
  final state = ReserveTableState();
  final user_id = UserStore.to.profile.id;
  final textController = TextEditingController();

  @override
  void onInit(){
    super.onInit();
    textController.text = 1.toString();
  }

}