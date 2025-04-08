// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// colors
class Constants {

  // static const Color primaryColor = Color(0xFF0681E6);
  static const Color primaryColor = Color(0xFF0E7CF4);
  // static const Color primaryColor = Color(0xFF085DB6);
  static const Color secondaryColor = Color(0xFF04419E);
  static const Color accentColor = Color(0xFFB5CEE9);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  // hint color
  static const Color hintColor = Color(0xFFBDBDBD);
  // error color
  static const Color errorColor = Colors.red;
  // success color
  static const Color successColor = Color(0xFF43A047);
  static const Color lightGreen = Color(0xFFC6E7C3);
  // warning color
  static const Color warningColor = Color(0xFFFFB500);
  // info color
  static const Color infoColor = Color(0xFF2196F3);
// light color
  static const Color lightColor = Color(0xFFC5E3FC);
  static const Color lightGreenColor = Color(0xFFB9F6CA);

  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0x33c4c4c4);
  static const Color transparent = Colors.transparent;

  static const Color borderColor = Color(0x34000000);

  // dark color
  static const Color darkColor = Color(0xFF212529);
  static const Color black = Color(0xFF212529);

  // text color
  static const Color textColor = Color(0xFF212529);

  // text color
  static const Color textColorLight = Color(0xFF828282);
  static const Color textColorLight2 = Color(0xFC676767);
  static const int _primaryValue = 0xFF085DB6;

  static const Color salesColor = primaryColor;
  static const Color expenseColor = errorColor;
  static const Color profitColor = successColor;

  static const MaterialColor primarySwatch =
      MaterialColor(_primaryValue, <int, Color>{
    50: Color(0xFFE1ECF6),
    100: Color(0xFFB5CEE9),
    200: Color(0xFF84AEDB),
    300: Color(0xFF528ECC),
    400: Color(0xFF2D75C1),
    500: Color(_primaryValue),
    600: Color(0xFF0755AF),
    700: Color(0xFF064BA6),
    800: Color(0xFF04419E),
    900: Color(0xFF02308E),
  });
  static const int _accentValue = 0xFF87A6FF;
  static const MaterialColor accentSwatch =
      MaterialColor(_accentValue, <int, Color>{
    100: Color(0xFFBACCFF),
    200: Color(_accentValue),
    400: Color(0xFF5480FF),
    700: Color(0xFF3B6DFF),
  });
  // font size

  static const double appBarTextSize = 24;
  static const double fontSizeHeading = 22;
  static const double fontSizeBody = 20;
  static const double fontSizeSubTitle = 18;
  static const double fontSizeSmall = 15;
  static const double fontSizeTiny = 12;
  static const double fontSizeTinySmall = 10;
  static const double fontSizeTinySmallMini = 8;

  //web font
  static double normaltext = 3.sp;

  // font family
  static const String fontFamily = 'Montserrat';
  static const String rupeeSymbol = '₹';
  // icon size
  static const double iconSizeLarge = 24;
  static const double iconSizeSmall = 16;
  static const double iconSizeTiny = 12;
  // SHARED PREFERENCES KEYS
  static const String TOKEN = 'TOKEN';

  static String FIREBASE_TOKEN = "FIREBASE_TOKEN";

  static bool isLockEnabled = false;
  static String userType = "STAFF";

  // support email
}
