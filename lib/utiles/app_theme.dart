import 'package:findit/utiles/apptext_theme.dart';
import 'package:findit/utiles/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppTheme {
  static ThemeData darkTheme() {
    return ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
      canvasColor: ColorHelper.darkBackground,
      radioTheme: const RadioThemeData(
          fillColor: WidgetStatePropertyAll(Colors.white),
          overlayColor: WidgetStatePropertyAll(Colors.white)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: ColorHelper.darkBackground),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(size: 30),
          unselectedIconTheme: IconThemeData(size: 30),
          elevation: 0,
          backgroundColor: ColorHelper.darkBackground),
      iconTheme: const IconThemeData(color: ColorHelper.white),
      inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
        color: ColorHelper.white,
      )),
      colorScheme: ColorScheme.fromSeed(
          primary: ColorHelper.white, seedColor: Colors.white),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: ColorHelper.darkBackground,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorHelper.darkBackground,
              systemNavigationBarColor: ColorHelper.darkBackground,
              statusBarIconBrightness: Brightness.light)),
      scaffoldBackgroundColor: ColorHelper.darkBackground,
      textTheme: ApptextTheme.appTextTheme(),
    );
  }
}
