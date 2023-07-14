
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/common/widget/bottom_nav.dart';
import 'package:restaurant/common/widget/widget.dart';
import 'package:restaurant/pages/cart_history/index.dart';
import 'package:restaurant/pages/home/index.dart';
import 'package:restaurant/pages/home/sales/index.dart';
import 'package:restaurant/pages/profile/index.dart';
import 'package:restaurant/pages/receipts/index.dart';
import 'package:restaurant/theme.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildPageView(context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
      children:  const [
        SalesPage(),
        ReceiptsPage(),
        CartHistoryPage(),
        ProfilePage(),
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
