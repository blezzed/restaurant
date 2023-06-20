
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/pages/home/personal_inforation/index.dart';

class PersonalInformationPage extends GetView<PersonalInformationController> {
  const PersonalInformationPage({Key? key}) : super(key: key);

  Widget buildTextBuild(context,{
    required String hintText,
    TextEditingController? controller,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool obscure = false,
  }){
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 0.h),
      width: double.maxFinite,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).colorScheme.surfaceVariant
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscure,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).primaryColor
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.secondary
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Edit"
        ),
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(
              Icons.arrow_back_ios_new_rounded
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.w),
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(top: 40.h),
                child: Text(
                  "Personal Information",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24.sp
                  ),
                ),
              ),
              SizedBox(height: 40.h,),
              buildTextBuild(context, hintText: "Name", keyboardType: TextInputType.name,),
              SizedBox(height: 20.h,),
              buildTextBuild(context, hintText: "Last name", keyboardType: TextInputType.name,),
              SizedBox(height: 20.h,),
              buildTextBuild(context, hintText: "Email", keyboardType: TextInputType.emailAddress,),
              SizedBox(height: 20.h,),
              buildTextBuild(context, hintText: "Phone number", keyboardType: TextInputType.phone, obscure: true),
              SizedBox(height: 20.h,),
              SizedBox(height: 20.h,),
              FilledButton.tonal(
                onPressed: (){
                  if (controller.state.menuCheckbox.value){
                    //Get.offNamed("/reserve_table");
                  }else{
                    Get.back();
                  }
                },
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                        Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Theme.of(context).primaryColor
                        )
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.secondaryContainer
                    ),
                    fixedSize: MaterialStateProperty.all(
                        Size(double.maxFinite, 50.h)
                    ),
                    side: MaterialStateProperty.all(
                        BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1
                        )
                    )
                ),
                child: Text("Save"),
              ),
              SizedBox(height: 10.w,),
            ],
          ),
        ),
      ),
    );
  }
}
