import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/theme.dart';

void showCustomSnackBar(String message, {bool isError=true, String title="Error"}){
  Get.snackbar(title, message,
      titleText:Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 20.sp,
          )
      ),
      messageText: Text(
        message,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 12.sp,
        )
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? Colors.redAccent : AppColors.primary,
  );
}