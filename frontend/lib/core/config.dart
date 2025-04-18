// constants.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  // Font Family
  static const String fontFamily = 'Montserrat';
  static const String rupeeSymbol = '₹';

  // Font Sizes
  static double get fontSizeExtraLarge => 26.sp;
  static double get appBarTextSize => 24.sp;
  static double get fontSizeHeading => 22.sp;
  static double get fontSizeBody => 20.sp;
  static double get fontSizeSubTitle => 18.sp;
  static double get fontSizeSmall => 15.sp;
  static double get fontSizeTiny => 12.sp;
  static double get fontSizeTinySmall => 10.sp;
  static double get fontSizeTinySmallMini => 8.sp;

  // Icon Sizes
  static const double iconSizeLarge = 24;
  static const double iconSizeSmall = 16;
  static const double iconSizeTiny = 12;

  // Shared Preferences Keys
  static const String TOKEN = 'TOKEN';
  static String FIREBASE_TOKEN = "FIREBASE_TOKEN";
  static bool isLockEnabled = false;
  static String userType = "STAFF";
}
