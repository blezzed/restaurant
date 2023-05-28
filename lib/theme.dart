import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


abstract class AppColors {
  static const Color primary = const Color(0xFF89dad0);
  static const Color iconColor1 = const Color(0xFFffd28d);
  static const Color accent = const Color(0xFFfcab88);
  static const Color textColor = const Color(0xFFccc7c5);
  static const textDark = Color(0xFF000000);
  static const textGrey = Color(0xFF242424);
  static const Color paraColor = const Color(0xFF8f837f);
  static const Color buttonBackgroundColor = const Color(0xFFf7f6f4);
  static const Color signColor = const Color(0xFFa9a29f);
  static const Color titleColor = const Color(0xFF5c524f);
  static const Color mainBlackColor = const Color(0xFF332d2b);
  static const Color yellowColor = const Color(0xFFffd379);
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColors {
  static const background = Color.fromARGB(255, 247, 247, 247);
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

/// Reference to the application theme.
class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  final darkBase = ThemeData.dark();
  final lightBase = ThemeData.light();

  /// Light theme and its settings.
  ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: AppColors.primary,
    textTheme: TextTheme(
      labelLarge: GoogleFonts.roboto(
        color: AppColors.textGrey,
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
      ),
      labelMedium: GoogleFonts.roboto(
        color: AppColors.textGrey,
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
      ),
      labelSmall: GoogleFonts.roboto(
          color: AppColors.paraColor,
          fontWeight: FontWeight.w300,
          fontSize: 12.sp,
          height: 1.2
      ),
    ),

  );

  /// Dark theme and its settings.
  ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: AppColors.primary,

  );
}
