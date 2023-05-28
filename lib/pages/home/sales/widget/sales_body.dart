import 'dart:convert';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:restaurant/common/entities/entities.dart';
import 'package:restaurant/common/values/storage.dart';
import 'package:restaurant/common/widget/widget.dart';
import 'package:restaurant/pages/home/sales/index.dart';
import 'package:restaurant/theme.dart';

class SalesBody extends StatefulWidget {
  const SalesBody({Key? key}) : super(key: key);

  @override
  State<SalesBody> createState() => _SalesBodyState();
}

class _SalesBodyState extends State<SalesBody> {
  SalesController controller = Get.find();

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 190.h;

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.addListener(() {
        setState(() {
          _currPageValue= pageController.page!;
        });
      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //print(controller.pageController.page);
    return Obx(() => SmartRefresher(
      controller: controller.refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onLoading: controller.onLoading,
      onRefresh: controller.onRefresh,
      header: const WaterDropMaterialHeader(),
      child: SingleChildScrollView(
        child: Column(
          children: [

            // slider section
            Container(
                height: 270.h,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: controller.state.foodList.length,
                    itemBuilder: (context, position){
                      return _builderPageItem(position, controller.state.foodList[position]);
                    }
                )
            ),

            // dots
            DotsIndicator(
              dotsCount: controller.state.foodList.isEmpty? 1 : controller.state.foodList.length,
              position: _currPageValue,
              decorator: DotsDecorator(
                activeColor: AppColors.primary,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
              ),
            ),

            // products section
            SizedBox(height: 10.h,),
            Container(
                margin: EdgeInsets.only(left: 10.w,),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Popular",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(width: 10.w,),
                      Container(
                        margin: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          ".",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          "Food products",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                )
            ),
            SizedBox(height: 10.h,),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.state.recommendedProductList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      //Get.toNamed(RouteHelper.getRecommendedProduct(index, "home"));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
                      child: Row(
                        children: [
                          // image section
                          Container(
                            width: 100.w,
                            height: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.white38,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        BASE_URL+UPLOADS+controller.state.recommendedProductList[index].img!
                                    )
                                )
                            ),
                          ),
                          // text container
                          Expanded(
                            child: Container(
                              height: 90.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.r),
                                    bottomRight: Radius.circular(20.r)
                                ),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.state.recommendedProductList[index].name!,
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      "eat healthy food ",
                                      style: Theme.of(context).textTheme.labelSmall,
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          buildIconAndTextWidget(context: context ,icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),
                                          buildIconAndTextWidget(context: context ,icon: Icons.location_on, text: "1.7km", iconColor: AppColors.primary),
                                          buildIconAndTextWidget(context: context ,icon: Icons.access_time_rounded, text: "32min", iconColor: AppColors.accent),
                                        ]
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    ));
  }

  Widget _builderPageItem(int index, ProductModel foodProduct){
    Matrix4 matrix = Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale = 0.8;
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed("/productdetails", parameters: {
                  "page": "sales",
                  "product": jsonEncode(foodProduct.toJson())
                });
              },
              child: Container(
                height: 180.h,
                margin: EdgeInsets.only(left:10.w, right: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: const Color(0xff69c5df),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        BASE_URL+UPLOADS+foodProduct.img!
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 100.h,
                  margin: EdgeInsets.only(left:30.w, right: 30.w, bottom: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
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
                  child: Container(
                    padding: EdgeInsets.only(top:10.h, left:10.w, right: 20.w),
                    child: AppColumn(text: foodProduct.name!,),
                  )
              ),
            ),
          ]
      ),
    );
  }
}


