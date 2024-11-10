import 'package:findit/utiles/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApptextTheme {
  static TextTheme appTextTheme() {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: 22.h,
        fontWeight: FontWeight.bold,
        color: ColorHelper.black,
      ),
      titleMedium: TextStyle(
        fontSize: 18.h,
        fontWeight: FontWeight.bold,
        color: ColorHelper.black,
      ),
      titleSmall: TextStyle(
        fontSize: 16.h,
        fontWeight: FontWeight.bold,
        color: ColorHelper.black,
      ),
      displayLarge: TextStyle(
        fontSize: 20.h,
        color: ColorHelper.black,
      ),
      displayMedium: TextStyle(
        fontSize: 14.h,
        color: ColorHelper.black,
      ),
      displaySmall: TextStyle(
        fontSize: 12.h,
        color: ColorHelper.black,
      ),
    );
  }
}
