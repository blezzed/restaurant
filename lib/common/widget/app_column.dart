import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/common/widget/icon_and_text.dart';
import 'package:restaurant/theme.dart';

class AppColumn extends StatelessWidget {
  final String text;
  AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: 20.sp,
            overflow: TextOverflow.ellipsis
          ),
        ),
        SizedBox(height:5.h,),
        Row(
            children: [
              Wrap(
                  children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.primary, size: 14.w))
              ),
              SizedBox(width: 5.w),
              Text(
                "4.5",
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
    );
  }
}
