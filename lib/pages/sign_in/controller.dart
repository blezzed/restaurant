import 'dart:convert';
import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show extension;
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:restaurant/common/store/store.dart';
import 'package:restaurant/pages/sign_in/index.dart';

class SignInController extends GetxController{
  SignInController();
  final state = SignInState();
  //final emailController = TextEditingController();
  //final passwordController = TextEditingController();


  /*final db = FirebaseFirestore.instance;
  final user = UserStore.to.profile;
  String? _imgUrl;
  UserApi sp = UserApi();
  InternetProvider ip = InternetProvider();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      "openid"
    ]
  );


  Future<void> handleSignIn(String type) async {
    try{
      if(type=="email_and_password"){
        _signUp();
      }else if(type=="google"){
        var user = await _googleSignIn.signIn();
        if(user!=null){
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl??"assets/images/person.png";

          // saving to the user data
          UserData userData = UserData();
          userData.avatar = photoUrl;
          userData.name = displayName;
          userData.email = email;
          //userData.id = id;
          userData.type = 2;
          userData.created_at = "${DateTime.now()}";
          userData.hasCompany = false;

          asyncPostAllData(userData);
        }
      } else{
        if (kDebugMode) {
          print("....login type not sure....");
        }
      }
    } catch(e){
      if(kDebugMode){
        print("...error with login $e");
      }
    }
  }

  asyncPostAllData(UserData userData)async{
    UserApi sp = UserApi();
    InternetProvider ip = InternetProvider();

    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear ,
      dismissOnTap: true,
    );
    try{
      await ip.checkInternetConnection();

    }catch(e){
      EasyLoading.dismiss();
      print("Error: $e");
    }

    if (ip.hasInternet == false) {
      EasyLoading.dismiss();
      showCustomSnackBar("Check your Internet connection", title: "");
    } else {
      await sp.signInWithGoogle(userData).then((value) {
        if (sp.hasError == true) {
          EasyLoading.dismiss();
          showCustomSnackBar("${sp.errorCode}", title: "");
        } else {
          // checking whether user exists or not
          sp.checkUserExists(userData.id).then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(userData.id).then((value) {
                UserStore.to.saveProfile(value);
                Get.offAllNamed(AppRoutes.Home);
                if(userData.hasCompany == true){
                  sp.getUserCompanyProfile(value);
                }
                EasyLoading.dismiss();
              });
            } else {
              // user does not exist
              sp.saveDataToFirestore(userData)
                .then((value) {
                  UserStore.to.saveProfile(userData);
                  Get.offAllNamed(AppRoutes.Home);
                  EasyLoading.dismiss();

              });
            }
          });
        }
      });
    }
    //EasyLoading.dismiss();

  }

  Future<void> _signUp() async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear ,
      dismissOnTap: true,
    );
    try {
      // Authenticate with Firebase
      final creds =
      await firebase.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final user = creds.user;
      if(user != null){
        await sp.getUserDataFromFirestore(user.uid).then((value) {
          UserStore.to.saveProfile(value);
          Get.offAllNamed(AppRoutes.Home);
          if(value.hasCompany == true){
            sp.getUserCompanyProfile(value);
          }
          EasyLoading.dismiss();
        });
      }

    } on firebase.FirebaseAuthException catch (e) {
      switch (e.message){
        case "There is no user record corresponding to this identifier. The user may have been deleted.":
          try {
            // Authenticate with Firebase
            final creds =
            await firebase.FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );

            final user = creds.user;

            // saving to the user data
            if(user != null){
              UserData userData = UserData();
              userData.avatar = null;
              userData.name = null;
              userData.email = emailController.text;
              userData.id = user.uid;
              userData.access_token = user.uid;
              userData.type = 1;
              userData.created_at = "${DateTime.now()}";
              userData.hasCompany = false;

              sp.saveDataToFirestore(userData)
                  .then((value) {
                UserStore.to.saveProfile(userData);
                Get.offAllNamed(AppRoutes.AdditionalUserData);
                EasyLoading.dismiss();
              });
            }

          } on firebase.FirebaseAuthException catch (e) {
            EasyLoading.dismiss();
            showCustomSnackBar(e.message ?? 'Auth error', title: "");
            print(e.message);
          } catch (e, st) {
            logger.e('Sign up error', e, st);
            EasyLoading.dismiss();
            showCustomSnackBar('An error occurred', title: "");
          }
          EasyLoading.dismiss();
          break;
        default:
          EasyLoading.dismiss();
          showCustomSnackBar(e.message ?? 'Auth error', title: "");
          print(e.message);
      }
    } catch (e, st) {
      logger.e('Sign up error', e, st);
      EasyLoading.dismiss();
      showCustomSnackBar('An error occurred', title: "");
    }
    EasyLoading.dismiss();
  }*/

}