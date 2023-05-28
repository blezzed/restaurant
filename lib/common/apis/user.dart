
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant/common/apis/apis.dart';
import 'package:restaurant/common/values/storage.dart';

//var logger = log.Logger();

class UserApi extends ChangeNotifier{
  static UserApi get to => Get.find();
  /*bool _hasError = false;
  bool get hasError => _hasError;

  String? _errorCode;
  String? get errorCode => _errorCode;

  String? _provider;
  String? get provider => _provider;

  UserApi();

  Future signInWithGoogle(UserData userData) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      // executing our authentication
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        // signing to firebase user instance
        final User userDetails =
        (await firebaseAuth.signInWithCredential(credential)).user!;

        userData.access_token = googleSignInAuthentication.accessToken;
        userData.id = userDetails.uid;

        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            _errorCode =
            "You already have an account with us. Use correct provider";
            _hasError = true;
            notifyListeners();
            break;

          case "null":
            _errorCode = "Some unexpected error while trying to sign in";
            _hasError = true;
            notifyListeners();
            break;
          default:
            _errorCode = e.toString();
            _hasError = true;
            notifyListeners();
        }
      }
    } else {
      _hasError = true;
      notifyListeners();
    }
  }

  Future<bool> checkUserExists(userid) async {
    DocumentSnapshot snap =
    await FirebaseFirestore.instance.collection('users').doc(userid).get();
    if (snap.exists) {
      print("EXISTING USER");
      return true;
    } else {
      print("NEW USER");
      return false;
    }
  }

  Future saveDataToFirestore(UserData userData) async {
    final docRef = FirebaseFirestore.instance.collection("users").doc(userData.id)
        .withConverter(
      fromFirestore: UserData.fromFirestore,
      toFirestore: (UserData user, options) => user.toJson(),
    );
    await docRef.set(userData);
    notifyListeners();
  }

  Future getUserDataFromFirestore(userId) async {
    final ref = FirebaseFirestore.instance.collection("users").withConverter(
      fromFirestore: UserData.fromFirestore,
      toFirestore: (UserData user, _) => user.toJson(),
    );
    final docSnap = await ref.doc(userId).get();
    return docSnap.data();
  }*/

  Future<Response> getFoodProductsList() async{
    return await ApiClient.to.getData(FOOD_PRODUCT_URL);
  }

  Future<Response> getRecommendedProductsList() async{
    return await ApiClient.to.getData(RECOMMENDED_PRODUCT_URL);
  }

}