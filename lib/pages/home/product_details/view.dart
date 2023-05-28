
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/common/widget/widget.dart';
import 'package:restaurant/pages/home/product_details/index.dart';
import 'package:restaurant/theme.dart';

import '../../../common/values/values.dart';

class ProductDetailsPage extends GetView<ProductDetailsController> {
  const ProductDetailsPage({Key? key}) : super(key: key);

  /*Widget _buildIconAndTextWidget({context, required String icon, required String text, Color iconColor = AppColors.primary, String? route}){
    return Row(
        children: [
          GestureDetector(
            onTap: (){
              if(route=="location"){
                Get.toNamed("/mainmap", parameters: {
                  "company": jsonEncode(controller.state.product.value!.company!.toJson())
                });
              }
            },
            child: SizedBox(
              width: 23.w,
              height: 23.w,
              child: Image(
                color: iconColor,
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/icons/$icon"
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w,),
          Text(
            text,
            style: Theme.of(context).textTheme.labelSmall,
          )
        ]
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Stack(
          children: [
            // background image
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                    width: double.maxFinite,
                    height: 300.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            BASE_URL+UPLOADS+controller.state.product.value!.img!
                        ),
                      )
                  ),
                    /*child: CachedNetworkImage(
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      imageUrl: controller.state.product.value!.img!,
                      errorWidget: (context, url, error) => const Image(
                        fit: BoxFit.cover,
                          image: AssetImage(
                          "assets/images/backup.jpg"
                      )),
                    )*/
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
                              backgroundColor: AppColors.primary,
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
                bottom: 0,
                top: 280.h,
                child: Container(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.w),
                          topRight: Radius.circular(20.w)
                      ),
                      color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 0.h, bottom: 0.w),
                        height: 100.h,
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.state.product.value!.name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                            SizedBox(height: 7.h,),
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
                            SizedBox(height: 10.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  buildIconAndTextWidget(context: context ,icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),
                                  buildIconAndTextWidget(context: context ,icon: Icons.location_on, text: "1.7km", iconColor: AppColors.primary),
                                  buildIconAndTextWidget(context: context ,icon: Icons.access_time_rounded, text: "32min", iconColor: AppColors.accent),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "Desciption",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 18.sp
                        ),
                      ),
                      SizedBox(height: 10.h,),
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
        height: 100.h,
        padding: EdgeInsets.only(top: 20.w, bottom: 20.w, left: 20.w, right: 20.w),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.r),
                topLeft: Radius.circular(40.r)
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.h, right: 20.h),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
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
                  SizedBox(width: 5.w),
                  Text(
                    "${controller.inCartItems}",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 14.sp
                    ),
                  ),
                  SizedBox(width: 5.w),
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
            GestureDetector(
              onTap: (){
                controller.addItem(controller.state.product.value!);
              },
              child: Container(
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.h, right: 20.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "\$${controller.state.product.value!.price!.toStringAsFixed(2)} | add to cart",
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
