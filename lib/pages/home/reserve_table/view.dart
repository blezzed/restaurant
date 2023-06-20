
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/pages/home/reserve_table/index.dart';

class ReserveTablePage extends GetView<ReserveTableController> {
  const ReserveTablePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.h,
            bottom: 0.h,
            child: Image.asset(
              "assets/images/Vibia.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
              child: SizedBox(),
            ),
          ),
          SafeArea(
            child: Container(
            margin: EdgeInsets.all(10.w),
            height: double.maxFinite,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20.r)
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15.w, top: 15.h, bottom: 10.h),
                    width: double.maxFinite,
                    //height: 40.h,
                    child: Text(
                      "Reserve Table",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                        fontSize: 24.sp

                      ),
                    ),
                  ),
                  Stepper(
                    currentStep: controller.state.currentStep.value,
                    controlsBuilder: (BuildContext context, ControlsDetails details){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                              details.onStepContinue;
                              if (controller.state.currentStep.value < 2) {
                                controller.state.currentStep.value += 1;
                              }else{
                                Get.toNamed("/menu_list");
                              }
                            },
                            child: Container(
                                padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 15.h, right: 15.h),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  "Continue",
                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                      color: Colors.white,
                                      fontSize: 14.sp
                                  ),
                                )
                            ),
                          ),
                          SizedBox(width: 15.w,),
                          InkWell(
                            onTap: (){
                              details.onStepCancel;
                              if (controller.state.currentStep.value >0) {
                                controller.state.currentStep.value -= 1;
                              }else{
                                Get.back();
                              }
                            },
                            child: Container(
                                padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 15.h, right: 15.h),
                                decoration: BoxDecoration(
                                  //color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  "Back",
                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14.sp
                                  ),
                                )
                            ),
                          ),

                        ],
                      );
                    },
                    steps: [
                      Step(
                        title: Text(
                          "Date",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        content: InkWell(
                          onTap: (){
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2023),
                                lastDate: DateTime(2025)
                            ).then((value) {
                              controller.state.selected_date.value = DateFormat.yMMMEd().format(value!);
                            });
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: 50.h,
                            margin: EdgeInsets.only(left: 0.w, right: 0.w, bottom: 40.h),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surfaceVariant,
                              borderRadius: BorderRadius.circular(15.r)
                            ),
                            child: Center(
                              child: Text(
                                controller.state.selected_date.value,
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context).primaryColor
                                ),
                              ),
                            ),
                          ),
                        ),
                        isActive: controller.state.currentStep.value >= 0,
                          state: controller.state.currentStep.value >=0 ? StepState.complete :StepState.disabled
                      ),
                      Step(
                        title: Text(
                          "Time",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        content: InkWell(
                          onTap: (){
                            showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
                              controller.state.selected_time.value = value!.format(context);
                            });
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: 50.h,
                            margin: EdgeInsets.only(left: 0.w, right: 0.w, bottom: 40.h),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surfaceVariant,
                                borderRadius: BorderRadius.circular(15.r)
                            ),
                            child: Center(
                              child: Text(
                                controller.state.selected_time.value,
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).primaryColor
                                ),
                              ),
                            ),
                          ),
                        ),
                        isActive: controller.state.currentStep.value >= 1,
                        state: controller.state.currentStep.value >=1 ? StepState.complete :StepState.disabled
                      ),
                      Step(
                        title: Text(
                          "Table ",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        content: Column(
                          children: [
                            Text(
                              "The number of people to attend",
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Theme.of(context).colorScheme.secondary
                              ),
                            ),
                            SizedBox(height: 15.h,),
                            Container(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 0.h),
                              width: double.maxFinite,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Theme.of(context).colorScheme.surfaceVariant
                              ),
                              child: TextField(
                                controller: controller.textController,
                                keyboardType: TextInputType.number,
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).primaryColor
                                ),
                                decoration: InputDecoration(
                                  hintText: "Number",
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
                            ),
                            SizedBox(height: 20.h,),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                      value: controller.state.menuCheckbox.value,
                                      onChanged: (bool? value){
                                        controller.state.menuCheckbox.value = value!;
                                      }
                                  ),
                                ),
                                SizedBox(width: 10.w,),
                                Text(
                                  "pick the food on the menu",
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 40.h,)
                          ],
                        ),
                        isActive: controller.state.currentStep.value >= 2,
                        state: controller.state.currentStep.value >=2 ? StepState.complete :StepState.disabled
                      )
                    ],
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }

  Widget controlsBuilder(BuildContext context, ControlsDetails details){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: (){
            details.onStepContinue;
          },
          child: Container(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 15.h, right: 15.h),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                "Continue",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp
                ),
              )
          ),
        ),
        SizedBox(width: 15.w,),
        InkWell(
          onTap: (){
            details.onStepCancel;
          },
          child: Container(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 15.h, right: 15.h),
              decoration: BoxDecoration(
                //color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                "Back",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14.sp
                ),
              )
          ),
        ),
      ],
    );
  }
}
