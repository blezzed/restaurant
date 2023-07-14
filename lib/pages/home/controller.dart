import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/common/store/store.dart';
import 'package:restaurant/pages/home/index.dart';

class HomeController extends GetxController{
  HomeController();
  final state = HomeState();
  final user_id = UserStore.to.profile.id;

  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void handlePageChanged (int index){
    state.page.value = index;
  }

  void handleNavBarTap(int index){
    pageController.jumpToPage(index);
  }

  @override
  void onInit(){
    super.onInit();
    state.tabTitles.value = ["Home", "Order", "Chat", "Profile"];

    pageController = PageController(initialPage: state.page.value);
  }

}