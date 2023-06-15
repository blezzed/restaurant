
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/common/widget/widget.dart';
import 'package:restaurant/pages/home/product_details/index.dart';
import 'package:restaurant/pages/home/reserve/index.dart';
import 'package:restaurant/theme.dart';

import '../../../common/values/values.dart';

class ReservePage extends GetView<ReserveController> {
  const ReservePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
          children: [
            // background image

            Positioned(
                left: 0,
                right: 0,
                child: Container(
                    width: double.maxFinite,
                    height: 350.h,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r)
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        /*image: AssetImage(
                          "assets/images/JackDaniels.jpg",
                        ),*/
                        image: NetworkImage(
                            BASE_URL+UPLOADS+controller.state.product.value!.img!
                        ),
                      )
                  ),
                )
            ),
            // icon widget
            Positioned(
                left: 20.w,
                right: 20.w,
                top: 45.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: const TopAppIcon(icon: Icons.arrow_back_ios, )),

                    GestureDetector(
                      onTap: (){
                        Get.toNamed("/cart");
                      },
                      child: Stack(
                        children: [
                          const TopAppIcon(icon: Icons.shopping_cart_outlined, iconColor: AppColors.textGrey),
                          controller.totalItems>=1?
                          Positioned(
                            top: 0, right: 0,
                            child: TopAppIcon(
                              icon: Icons.circle,
                              size:20.w,
                              iconColor: Colors.transparent,
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          ):Container(),
                          controller.totalItems>=1?
                          Positioned(
                              top: 3, right: 3,
                              child: Center(
                                child: Text(
                                  "${controller.totalItems}",
                                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                      color: Colors.white
                                  ),
                                ),
                              )
                          ):Container()
                        ],
                      ),
                    ),
                  ],
                )
            ),
            // description of product
            Positioned(
                left: 0,
                right: 0,
                //bottom: 0,
                top: 260.h,
                child: Container(
                  //padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  width: double.maxFinite,
                  height: 160.h,
                  child: Image.asset(
                      "assets/images/reserve_curve2.png",
                    fit: BoxFit.cover,
                    color: Theme.of(context).colorScheme.background,
                  ),
                )
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 320.h,
                child: Container(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.w),
                        height: 105.h,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFFe8e8e8),
                                spreadRadius: 1,
                                blurRadius: 1.0,
                                offset: Offset(0, 1),
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-5, 0),
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(5, 0),
                              )
                            ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                children: [
                                  Wrap(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: double.parse("${controller.state.product.value!.stars!}"),
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 14.w,
                                          ignoreGestures: true,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 0.w),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: AppColors.yellowColor,
                                            size: 14.w,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        )
                                      ]
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "${controller.state.product.value!.stars!}",
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "1287",
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "comments",
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                ]
                            ),
                            SizedBox(height: 5.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.state.product.value!.name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 18.sp
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  buildIconAndTextWidget(context: context ,icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),
                                  buildIconAndTextWidget(context: context ,icon: Icons.location_on, text: "1.7km", iconColor: Theme.of(context).primaryColor),
                                  buildIconAndTextWidget(context: context ,icon: Icons.access_time_rounded, text: "32min", iconColor: AppColors.accent),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 0.h, bottom: 0.h, left: 0.h, right: 0.h),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      controller.state.delivery.value = true;
                                    },
                                    child: Container(
                                        padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 10.h, right: 10.h),
                                        decoration: BoxDecoration(
                                          color: controller.state.delivery.isTrue? Theme.of(context).primaryColor: Theme.of(context).colorScheme.secondaryContainer,
                                          borderRadius: BorderRadius.circular(10.r),
                                        ),
                                        child: Text(
                                          "Delivery",
                                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                              color: controller.state.delivery.isTrue? Colors.white: Theme.of(context).primaryColor,
                                              fontSize: 14.sp
                                          ),
                                        )
                                    )),
                                GestureDetector(
                                    onTap: (){
                                      controller.state.delivery.value = false;
                                    },
                                    child: Container(
                                        padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 10.h, right: 10.h),
                                        decoration: BoxDecoration(
                                          color: controller.state.delivery.isTrue? Theme.of(context).colorScheme.secondaryContainer: Theme.of(context).primaryColor,
                                          borderRadius: BorderRadius.circular(10.r),
                                        ),
                                        child: Text(
                                          "Reserve table",
                                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                              color: controller.state.delivery.isTrue? Theme.of(context).primaryColor: Colors.white,
                                              fontSize: 14.sp
                                          ),
                                        )
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 10.h, right: 10.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFFe8e8e8),
                                    spreadRadius: 1,
                                    blurRadius: 1.0,
                                    offset: Offset(0, 1),
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-5, 0),
                                  ),
                                ]
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      controller.setQuantity(false);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 0.w, right: 7.w),
                                      child: const Icon(Icons.remove, color: AppColors.signColor),
                                    )),
                                SizedBox(width: 8.w),
                                Text(
                                  "${controller.inCartItems}",
                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                      fontSize: 14.sp
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                GestureDetector(
                                    onTap: (){
                                      controller.setQuantity(true);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 7.w, right: 0.w),
                                      child: const Icon(Icons.add, color: AppColors.signColor),
                                    ))
                              ],
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        "Desciption",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 16.sp
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(text: controller.state.product.value!.description!)))
                    ],
                  ),
                )
            ),

          ]
      ),
      bottomNavigationBar: Container(
        height: 60.h,
        padding: EdgeInsets.only(top: 5.w, bottom: 5.w, left: 5.w, right: 10.w),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            GestureDetector(
              onTap: (){
                controller.addItem(context, controller.state.product.value!);
              },
              child: Container(
                  padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 10.h, right: 10.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    "add to cart",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 14.sp
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    ));
  }
}
