import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/common/store/store.dart';
import 'package:restaurant/pages/home/index.dart';
import 'package:restaurant/pages/profile/index.dart';

class ProfileController extends GetxController{
  ProfileController();
  final state = ProfileState();
  final user_id = UserStore.to.profile.id;

  logout(){
    UserStore.to.onLogout();
  }

  @override
  void onInit(){
    super.onInit();

  }

}