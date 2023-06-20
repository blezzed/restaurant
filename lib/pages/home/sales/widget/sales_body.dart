import 'dart:convert';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:restaurant/common/entities/entities.dart';
import 'package:restaurant/common/values/storage.dart';
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
            SizedBox(height: 10.h,),
            Container(
              width: double.maxFinite,
              height: 400.h,
              padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80.r),
                  topLeft: Radius.circular(80.r),
                ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Little Cafe",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.yellowColor
                    ),
                  ),
                  Text(
                    "Zimbabwe",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).cardColor
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 200.w
                        ),
                        child: Wrap(
                          children: [
                            Text(
                              "We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.",
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                fontSize: 16.sp,
                                color: Theme.of(context).cardColor
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 140.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/Burgers.jpg",
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  FilledButton.tonal(
                      onPressed: (){
                        Get.toNamed("/personal_information");
                      },
                      child: Text(
                          'Reserve a table',
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              padding: EdgeInsets.all(10.w),
              width: double.maxFinite,
              child: Text(
                "ORDER FOR DELIVERY!",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            // slider section
            Container(
                height: 430.h,
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
                activeColor: Theme.of(context).primaryColor,
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
                      Get.toNamed("/reserve", parameters: {
                        "page": "sales",
                        "product": jsonEncode(controller.state.recommendedProductList[index].toJson())
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
                      height: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r)
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // text container
                          Expanded(
                            child: Container(
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
                                    SizedBox(height: 5.h),
                                    Text(
                                      controller.state.recommendedProductList[index].description!,
                                      maxLines: 2,
                                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                        overflow: TextOverflow.ellipsis,

                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      "\$${controller.state.recommendedProductList[index].price!.toStringAsFixed(2)}",
                                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 14

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // image section
                          Container(
                            width: 70.w,
                            height: 70.w,
                            margin: EdgeInsets.only(right: 5.w, bottom: 5.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white38,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        BASE_URL+UPLOADS+controller.state.recommendedProductList[index].img!
                                    )
                                )
                            ),
                          ),
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
                height: 310.h,
                margin: EdgeInsets.only(left:10.w, right: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Theme.of(context).colorScheme.secondaryContainer,
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
                  margin: EdgeInsets.only(left:10.w, right: 10.w, bottom: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top:10.h, left:10.w, right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            children: [
                              Wrap(
                                  children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.yellowColor, size: 14.w))
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "4.5",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ]
                        ),
                        Text(
                          foodProduct.name!,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              overflow: TextOverflow.ellipsis
                          ),
                        ),
                        Text(
                          "\$${foodProduct.price!}.00",
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              overflow: TextOverflow.ellipsis,
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          ]
      ),
    );
  }
}


