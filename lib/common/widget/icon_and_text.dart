import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/theme.dart';

Widget buildIconAndTextWidget({
  context,
  required IconData icon,
  required String text,
  Color iconColor = AppColors.primary,
  String? route,
  //QueryDocumentSnapshot<ProductItem>? item
}){
  return Row(
      children: [
        GestureDetector(
          onTap: (){
            /*if(route=="location"){
              Get.offNamed("/mainmap", parameters: {
                "company": jsonEncode(item!.data().company!.toJson())
              });
            }*/
          },
          child: Icon(icon, color: iconColor, size: 24.h,),
        ),
        SizedBox(width: 5.w,),
        Text(
          text,
          style: Theme.of(context).textTheme.labelSmall,
        )
      ]
  );
}