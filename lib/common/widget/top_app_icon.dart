import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopAppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double? size;
  final double? iconSize;

  const TopAppIcon({Key? key,
    required this.icon,
    this.backgroundColor= const Color(0xFFfcf4e4),
    this.iconColor=const Color(0xff756d54),
    this.size,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size??40.w,
      height: size??40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize??16.w,
      ),
    );
  }
}
