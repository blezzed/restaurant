
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/pages/sign_in/index.dart';

import '../../theme.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  Widget _buildThirdPartySignIn({context, required String loginType, required String text}){
    return GestureDetector(
      onTap: (){
        //print(".....Sign up from third party");
        //controller.handleSignIn(loginType);
      },
      child: Container(
        width: 290.w,
        height: 40.h,
        padding: EdgeInsets.all(5.h),
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          //border: Border.all(color: AppColors.textGrey)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Image.asset(
                "assets/icons/$loginType.png"
              ),
            ),
            Container(
              child: Text(
                "continue with $text",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  //color: AppColors.textGrey
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOrWidget(){
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 35.h),
      child: Row(
        children: [
          Expanded(child: Divider(
            indent: 50,
            endIndent: 10,
            height: 3.h,
          )),
          Text("or"),
          Expanded(child: Divider(
            endIndent: 50,
            indent: 10,
            height: 3.h,
          )),
        ],
      ),
    );
  }

  Widget _buildTextField({
    context,
    hintText,
     TextEditingController? controller,
    TextInputType? keyboardType,
    bool obscureText = false,
    bool suggestions = true
  }){
    return Container(
      width: 290.w,
      //height: 50.h,
      padding: EdgeInsets.only(left: 10.w, ),
      decoration: BoxDecoration(
        //color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        enableSuggestions: suggestions,
        style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 14.sp
        ),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 14.sp
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)
            ),
            //focusedBorder: InputBorder.none
        ),
      ),
    );
  }

  Widget _buildSignUpBtn({
    context,
    text,
    VoidCallback? onTap
  }){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 290.w,
        height: 45.h,
        padding: EdgeInsets.only( top: 10.h, bottom: 10.h),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10.r)
        ),
        child: Center(
          child: Text(
            text,
            style:Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.background,
              fontWeight: FontWeight.w600
            )
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: Stack(
          children: [

            Positioned(
              child: ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                  height: 400.h,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                height: 450.h,
                width: double.maxFinite,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.5)
                ),
              ),
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(10.w),
                child: Text(
                  "Restaurant",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w700,
                      fontSize: 30.sp
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                height: 500.h,
                margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 200.h),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80.r),
                        bottomRight: Radius.circular(80.r)
                    )
                ),
                child: controller.state.signup.value ?AnimatedContainer(duration: Duration(seconds: 1),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                              text:  "Login",
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context).primaryColor
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  controller.state.signup.value = false;
                                }
                            )
                          ),
                          Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).primaryColor,)
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      _buildTextField(
                        context: context,
                        hintText: "Name",
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 20.h,),
                      _buildTextField(
                        context: context,
                        hintText: "Surname",
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 20.h,),
                      _buildTextField(
                        context: context,
                        hintText: "Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20.h,),
                      _buildTextField(
                        context: context,
                        hintText: "phone",
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 20.h,),
                      _buildTextField(
                          context: context,
                          hintText: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true
                      ),
                      SizedBox(height: 20.h,),
                      _buildSignUpBtn(
                          context: context,
                          text: "SignUp"
                      ),
                    ],
                  ),
                ):AnimatedContainer(
                  duration: Duration(seconds: 1),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text:  "SignUp",
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                      color: Theme.of(context).primaryColor
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      controller.state.signup.value = true;
                                    }
                              )),
                          Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).primaryColor,)
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      _buildTextField(
                        context: context,
                        hintText: "Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20.h,),
                      _buildTextField(
                          context: context,
                          hintText: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true
                      ),
                      SizedBox(height: 20.h,),
                      _buildSignUpBtn(
                          context: context,
                          text: "Login"
                      ),
                      SizedBox(height: 20.h,),
                      _buildOrWidget(),
                      _buildThirdPartySignIn(
                          context: context,
                          text: "Google",
                          loginType: "google"
                      ),
                      _buildThirdPartySignIn(
                          context: context,
                          text: "Apple",
                          loginType: "apple"
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    ));
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    var path = Path();
    //(0,0)  point 1
    path.lineTo(0, h-50); // point 2
    path.quadraticBezierTo(w*0.25, h - 100, w*0.5, h - 50);
    path.quadraticBezierTo(w * 0.75, h, w, h - 50);
    path.lineTo(w, 0); // point 5
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}
