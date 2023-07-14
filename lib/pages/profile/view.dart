
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/common/widget/bottom_nav.dart';
import 'package:restaurant/pages/cart_history/index.dart';
import 'package:restaurant/pages/home/index.dart';
import 'package:restaurant/pages/home/sales/index.dart';
import 'package:restaurant/pages/profile/index.dart';
import 'package:restaurant/theme.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  Widget buildListTile({required BuildContext context, required String title, required IconData icon, VoidCallback? onTap}){
    return Material(
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10.r),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(left: 10.w, top: 15.h, bottom: 15.w),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.textGrey.withOpacity(0.9),
              ),
              SizedBox(width: 10.w,),
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.textGrey.withOpacity(0.9),
                  fontWeight: FontWeight.w700
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: 250.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.r),
                    bottomLeft: Radius.circular(50.r),
                )
              ),
            )
          ),
          Positioned(
            top: 0.h,
              child: Container(
                height: 250.h,
                width: 250.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(180.r),
                    bottomLeft: Radius.circular(50.r),
                    //topRight: Radius.circular(180.r)
                  )
                  ,
                ),
              )
          ),
          Container(
            height: 450.h,
            width: double.maxFinite,
            padding: EdgeInsets.all(10.w),
            margin: EdgeInsets.only(top: 180.h, left: 20.w, right: 20.w),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.3),
                  blurRadius: 5,
                  offset: Offset(0, 1)
                ),
              ]
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Material(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50.r),
                        onTap: (){
                          Get.toNamed("/personal_information");
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10.w),
                            child: Icon(
                              Icons.edit_rounded
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  "Rayn Adams",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 18.sp
                  ),
                ),
                Text(
                  "rayn@gmail.com",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.paraColor
                  ),
                ),
                SizedBox(height: 20.h,),
                Divider(

                  indent: 5.w,
                  endIndent: 5.w,
                ),
                buildListTile(context: context, title: "My address", icon: Icons.location_pin, onTap: (){}),
                buildListTile(context: context, title: "Account", icon: Icons.account_balance_wallet_rounded,),
                buildListTile(context: context, title: "Notification", icon: Icons.notification_add_rounded,),
                buildListTile(context: context, title: "About", icon: Icons.question_mark_rounded,),
                buildListTile(context: context, title: "Logout", icon: Icons.logout, onTap: (){
                  controller.logout();
                }),
              ],
            ),
          ),
          Container(
            height: 90.w,
            width: 90.w,
            margin: EdgeInsets.only(left: 140.w, top: 130.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(80.r),
              border: Border.all(
                color: Theme.of(context).colorScheme.background,
                width: 3
              )
            ),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(10.w),
              child: Text(
                "Profile",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
