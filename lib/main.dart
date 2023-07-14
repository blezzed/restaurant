import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/common/apis/apis.dart';
import 'package:restaurant/common/routes/pages.dart';
import 'package:restaurant/global.dart';
import 'package:restaurant/theme.dart';

Future<void> main() async {
  dotenv.load(fileName: ".env");
  await Global.init();
  runApp(MyApp(
      appTheme: AppTheme()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appTheme,});

  final AppTheme appTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 780),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Restaurant',
          theme: appTheme.light,
          darkTheme: appTheme.dark,
          themeMode: ThemeMode.light,
          initialRoute: AppPages.getInitial(),
          initialBinding: GlobalBindings(),
          getPages: AppPages.routes,
          //home: const MyHomePage(title: 'Eddy'),
        );
      }
    );
  }
}

