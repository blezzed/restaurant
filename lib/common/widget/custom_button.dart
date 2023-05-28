import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/theme.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final IconData? icon;

  const CustomButton({Key? key,
    this.onPressed,
    required this.buttonText,
    this.transparent=false,
    this.margin,
    this.height,
    this.width,
    this.fontSize,
    this.radius,
    this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _flatButton = TextButton.styleFrom(
        backgroundColor: onPressed==null?Theme.of(context).disabledColor:transparent?Colors.transparent:AppColors.primary,
        minimumSize: Size(width==null?280.w:width!, height==null?50.h: height!),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius??5.r)
        )
    );
    return Center(
      child: SizedBox(
          width: width ?? double.maxFinite,
          height: height??50.h,
          child: TextButton(
            onPressed: onPressed,
            style: _flatButton,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!=null?Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Icon(
                      icon,
                      color: transparent?Theme.of(context).primaryColor:Theme.of(context).cardColor,
                    )
                ): SizedBox(),
                Text(
                  buttonText,
                  style: TextStyle(
                      fontSize: fontSize ?? 16.sp,
                      color: transparent?Theme.of(context).primaryColor:Theme.of(context).cardColor
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
