import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/common/widget/widget.dart';
import 'package:restaurant/pages/cart_history/index.dart';
import 'package:restaurant/theme.dart';

import '../../common/values/values.dart';

class CartHistoryPage extends GetView<CartHistoryController> {
  const CartHistoryPage({Key? key}) : super(key: key);

  Widget timeWidget(context, int index){
    var outputDate = DateTime.now().toString();
    if(index<controller.getItems.length){
      DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(controller.cartOrderTimeToList[index]);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
      outputDate = outputFormat.format(inputDate);
    }
    return Text(
      outputDate,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
          fontWeight: FontWeight.w500,
        color: AppColors.primary.withOpacity(0.5)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var cartList = List.from(controller.state.getItems);

    var listCount = 0;

    return Obx(() => Scaffold(
      body: Column(
        children: [
          Container(
              width: double.maxFinite,
              height: 80.h,
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: EdgeInsets.only(top: 20.h, right: 10.h, left:10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cart History",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textGrey
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.clearAllHistory();
                    },
                      child: const TopAppIcon(icon: Icons.clear_all_outlined, iconColor: Colors.white, backgroundColor: Colors.red,))
                ],
              )
          ),
          controller.getItems.isNotEmpty ? Expanded(child: Container(
            margin: EdgeInsets.only(
              top: 10.h,
              right: 10.w,
              left: 10.w,
            ),
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: controller.cartItemsPerOrderToList.length,
                  itemBuilder: (_, index) {
                    var unique = cartList.map((element) => element.time).toSet();
                    cartList.retainWhere((element) => unique.remove(element.time));

                    var items = cartList[index];
                    RxList generateList = controller.cartItemsPerOrderToList.toList().obs;
                    return Slidable(
                      endActionPane:  ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          CustomSlidableAction(
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              onPressed: (context) => controller.onDismissed(),
                            child: Container(
                              width: 50.w,
                              height: 50.w,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: const Image(
                                image: AssetImage("assets/icons/trash.png"),
                                fit: BoxFit.cover,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      child: Container(
                        //height: 120.h,
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            timeWidget(context, index),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.r),
                                        border: Border.all(width: 1, color: AppColors.primary.withOpacity(0.5)),
                                      ),
                                      child: Text(
                                        "Re-Order",
                                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primary.withOpacity(0.5)
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(generateList[index], (value){
                                      var item = controller.state.storageItem.where((p) => p.time==controller.cartOrderTimeToList[index]).toList();

                                      return value<=2?Container(
                                        margin: EdgeInsets.only(right: 10.w),
                                        child: Container(
                                          height: 65.w,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.r),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      BASE_URL+UPLOADS+item[value].img!
                                                  )
                                              )
                                          ),
                                        ),
                                      ):Container();
                                    })
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),
          )) : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 190.h,),
              const NoDataPage(text: "you didn't buy any so far !"),
            ],
          )
        ],
      ),
    ));
  }
}
