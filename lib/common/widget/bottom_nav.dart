

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/pages/home/index.dart';
import 'package:restaurant/theme.dart';


class BottomNav extends GetView<HomeController> {
  BottomNav({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.w),
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            controller.state.page.value=index;
            controller.handleNavBarTap(index);
            HapticFeedback.lightImpact();
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == controller.state.page.value
                    ? 115.w
                    : 60.w,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: index == controller.state.page.value ? 40.w : 0.w,
                  width: index == controller.state.page.value ? 115.w : 0.w,
                  decoration: BoxDecoration(
                    color: index == controller.state.page.value
                        ? AppColors.primary.withOpacity(.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == controller.state.page.value
                    ? 110.w
                    : 60.w,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width:
                          index == controller.state.page.value ? 45.w : 0,
                        ),
                        AnimatedOpacity(
                          opacity: index == controller.state.page.value ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Text(
                            index == controller.state.page.value
                                ? controller.state.tabTitles[index]
                                : '',
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width:
                          index == controller.state.page.value ? 10.w : 20.w,
                        ),
                        Icon(
                          listOfIcons[index],
                          size: 25.w,
                          color: index == controller.state.page.value
                              ? AppColors.primary
                              : Colors.black26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  RxList<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.archive_sharp,
    Icons.shopping_cart,
    Icons.person_rounded,
  ].obs;
}
