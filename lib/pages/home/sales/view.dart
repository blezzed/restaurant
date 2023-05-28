import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/pages/home/sales/index.dart';
import 'package:restaurant/pages/home/sales/widget/widget.dart';
import 'package:restaurant/theme.dart';

class SalesPage extends GetView<SalesController> {
  const SalesPage({Key? key}) : super(key: key);

  AppBar _buildAppBar(context){
    return AppBar(
      title: Container(
          child: Container(
              margin: EdgeInsets.only(top: 0.h, bottom: 0.h),
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Column(
                      children:[
                        Text(
                          "Restaurant",
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "webber",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            const Icon(Icons.arrow_drop_down_rounded, color: Colors.black,)
                          ],
                        ),
                      ]
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: (){
                        showDialog<void>(
                          context: context,
                          barrierDismissible: true, // user must tap button!
                          builder: (BuildContext context) {
                            return const SearchDialog();
                          },
                        );
                        //()=>Get.dialog(const SearchDialog());
                      },
                      child: Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: AppColors.primary,
                          ),
                          child: Icon(Icons.search, color: Colors.white, size: 24.w,)
                      ),
                    ),
                  )
                ],
              )
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const SalesBody(),
    );
  }
}
