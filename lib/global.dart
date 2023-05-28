
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant/common/apis/apis.dart';
import 'package:restaurant/common/store/store.dart';

import 'common/services/storage.dart';
import 'common/values/values.dart';

class Global {
  static Future init() async{

    WidgetsFlutterBinding.ensureInitialized();

    Get.lazyPut(()=>ApiClient(appBaseUrl:BASE_URL));;
    Get.put(UserApi());

    await Get.putAsync<StorageService>(() => StorageService().init());
    Get.put<ConfigStore>(ConfigStore());

    /*await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseMessaging.instance.getInitialMessage();*/

    Get.put<UserStore>(UserStore());

    //Get.lazyPut<AddressController>(() => AddressController());
  }

}

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
  }

}