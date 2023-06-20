
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/common/entities/entities.dart';
import 'package:restaurant/common/widget/widget.dart';
import 'package:restaurant/pages/Menu_list/index.dart';

import '../../common/values/values.dart';

class MenuListPage extends GetView<MenuListController> {
  const MenuListPage({Key? key}) : super(key: key);

  SliverAppBar _buildSliverAppBar(context){
    return SliverAppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50.h,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: TopAppIcon(
                  icon: Icons.arrow_back_ios_rounded,
                  backgroundColor: Theme.of(context).colorScheme.background.withOpacity(0.5),
                  iconColor: Colors.black,
                ),

            ),
            Text(
              controller.state.totalSelected.value!=0?"${controller.state.totalSelected} selected":"",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox()
          ],
        ),
        pinned: true,
        expandedHeight: 220.h,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(bottom: 10.h),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.r),
                    bottomLeft: Radius.circular(30.r)
                )
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(right: 10.w, top: 10.h, bottom: 20.h),
                    child: Text(
                      "Menu",
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 30,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Row(
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
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
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
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget buildMenuTile(BuildContext context, MenuModel item){
    return Obx(() => GestureDetector(
      onTap: (){
        item.isSelected.value =
        !item.isSelected.value;

        item.isSelected.value? item.quantity.value +=1 : item.quantity.value = 0;

        controller.totalSelected;
      },
      onLongPress: (){
        if (item.isSelected.value==false){
          item.quantity.value +=1;
        }
        item.isSelected.value = true;
        controller.totalSelected;
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context){
            return Obx(() => AlertDialog(
              content: Container(
                height: 150.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // text container
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.product!.name!,
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                      color: Theme.of(context).primaryColor
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  item.product!.description!,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                    overflow: TextOverflow.ellipsis,

                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "\$${item.product!.price!.toStringAsFixed(2)}",
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
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
                                      BASE_URL+UPLOADS+item.product!.img!
                                  )
                              )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: (){
                              if (item.quantity.value > 0){
                                item.quantity.value -= 1;
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Icon(Icons.remove, color: Theme.of(context).colorScheme.primary),
                            )),
                        SizedBox(width: 8.w),
                        Text(
                          "${item.quantity.value}",
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 18.sp
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                            onTap: (){
                              item.quantity.value += 1;
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(20.r)
                              ),
                              child: Icon(Icons.add, color: Theme.of(context).colorScheme.background),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              //contentPadding: EdgeInsets.zero,
            ));
          }
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
        height: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: item.isSelected.value?Theme.of(context).colorScheme.secondaryContainer:Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // text container
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.product!.name!,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).primaryColor
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      item.product!.description!,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        overflow: TextOverflow.ellipsis,

                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "\$${item.product!.price!.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                      ),
                    ),
                  ],
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
                          BASE_URL+UPLOADS+item.product!.img!
                      )
                  )
              ),
            ),
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: SizedBox(height: 10.h,),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: controller.state.menuList.length,
                      (context, index){
                    MenuModel item = controller.state.menuList[index];
                    return buildMenuTile(context, item);
                  }
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: controller.state.totalSelected.value!=0?GestureDetector(
        onTap: (){
          showCustomSnackBar(
            "Dear customer, your reservation has been successfully confirmed. Check your inbox for the confirmation email.",
            title: "Reservation Confirmation",
            isError: false
          );
          Get.offAllNamed("/home");
        },
        child: Container(
            padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.h, right: 20.h),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "Order",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 14.sp
              ),
            )
        ),
      ):Container(),
    ));
  }
}
