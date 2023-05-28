
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/common/widget/bottom_nav.dart';
import 'package:restaurant/pages/cart_history/index.dart';
import 'package:restaurant/pages/home/index.dart';
import 'package:restaurant/pages/home/sales/index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildPageView(context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
      children: const [
        SalesPage(),
        Center(child: Text("receipt")),
        CartHistoryPage(),
        Center(child: Text("Profile")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: _buildPageView(context),
      bottomNavigationBar: BottomNav(),
    ));
  }
}
