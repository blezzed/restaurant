import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/common/widget/widget.dart';
import 'package:restaurant/pages/cart/index.dart';
import 'package:restaurant/theme.dart';

import '../../common/values/values.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartList = controller.state.getItems;
    return Obx(() => Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 20.w,
              right: 20.w,
              top: 40,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.back(result: "cart");
                        },
                        child: TopAppIcon(
                            icon: Icons.arrow_back_ios,
                            iconColor: Colors.white,
                            backgroundColor: Theme.of(context).primaryColor,
                            iconSize: 24.w
                        )),
                    SizedBox(width: 20.w*5,),
                  ]
              )
          ),
          controller.getItems.length>0 ? Positioned(
              left: 20.w,
              right: 20.w,
              top: 100.h,
              bottom: 0,
              child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (_, index){
                        return Container(
                          height: 100.h,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  /*Get.toNamed(
                                      "/productdetails", parameters: {
                                      "doc_uid": cartList[index].id!,
                                      "product": jsonEncode(
                                      cartList[index].product!.toJson())
                                      });*/
                                },
                                child: Container(
                                  width: 100.w,
                                  height: 100.w,
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              BASE_URL+UPLOADS+cartList[index].img!
                                          )
                                      )
                                  ),
                                ),),
                              SizedBox(width: 10.w),
                              Expanded(child: Container(
                                height: 100.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      cartList[index].name!,
                                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                    Text(
                                      "Fruits", //TODO check the type id
                                      style: Theme.of(context).textTheme.labelSmall,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$${cartList[index].price!.toStringAsFixed(2)}",
                                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                              color: Colors.red,
                                              fontSize: 16.sp
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                                onTap: (){
                                                  controller.addItem(context, cartList[index].product!, -1);

                                                },
                                                child: const Icon(Icons.remove, color: AppColors.signColor)),
                                            SizedBox(width:5.h),
                                            Text(
                                              "${cartList[index].quantity}",
                                              style: Theme.of(context).textTheme.labelMedium,
                                            ),
                                            SizedBox(width:5.h),
                                            GestureDetector(
                                                onTap: (){
                                                  controller.addItem(context, cartList[index].product!, 1);

                                                },
                                                child: const Icon(Icons.add, color: AppColors.signColor))
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      },
                    ),
                  )
              )): const NoDataPage(text: "Your cart is empty")
        ],
      ),
      bottomNavigationBar:  Container(
        height: 100.h,
        padding: EdgeInsets.only(top: 20.w, bottom: 20.w, left: 20.w, right: 20.w),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.r),
                topLeft: Radius.circular(40.r)
            )
        ),
        child: controller.getItems.length>0 ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.h, right: 20.h),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  "\$${controller.totalAmount.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 14.sp
                  ),
                )
            ),
            GestureDetector(
              onTap: (){
                controller.addToHistory();
              },
              child: Container(
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.h, right: 20.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "Check out",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 14.sp
                    ),
                  )
              ),
            )
          ],
        ): Container(),
      ),
    ));
  }
}
