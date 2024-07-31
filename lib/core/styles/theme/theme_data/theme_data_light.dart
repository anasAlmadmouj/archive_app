import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../imports/app_imports/app_imports.dart';

ThemeData themeDataLightArabic() => ThemeData(
  // scaffoldBackgroundColor: MyColors.scaffoldColor,
  useMaterial3: true,
  // primaryColor: MyColors.whiteColor,
  // colorSchemeSeed: MyColors.primaryColor,
  colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      background: MyColors.scaffoldColor,
      primary: MyColors.primaryColor,
      secondary: MyColors.lightGrayColor,
      primaryContainer: MyColors.whiteColor,
      secondaryContainer: MyColors.darkWhite,
      error: MyColors.redColor,
      onPrimary: MyColors.black
  ),
  scaffoldBackgroundColor: MyColors.scaffoldColor,
  fontFamily: 'NotoNaskhArabic',
  textTheme: textTheme,
  datePickerTheme: DatePickerThemeData(
    yearForegroundColor: MaterialStatePropertyAll(MyColors.black),
    yearStyle: TextStyle(
      fontSize: 16.sp,
    ),
  ),
);

ThemeData themeDataLightEnglish() => ThemeData(
  // scaffoldBackgroundColor: MyColors.scaffoldColor,
  useMaterial3: true,
  // primaryColor: MyColors.whiteColor,
  // colorSchemeSeed: MyColors.primaryColor,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    background: MyColors.scaffoldColor,
    primary: MyColors.primaryColor,
    secondary: MyColors.lightGrayColor,
    primaryContainer: MyColors.whiteColor,
    secondaryContainer: MyColors.darkWhite,
    error: MyColors.redColor,
    onPrimary: MyColors.black
  ),
  scaffoldBackgroundColor: MyColors.scaffoldColor,
  fontFamily: 'Roboto',
  textTheme: textTheme,
  datePickerTheme: DatePickerThemeData(
    yearForegroundColor: MaterialStatePropertyAll(MyColors.black),
    yearStyle: TextStyle(
      fontSize: 16.sp,
    ),
  ),
);

TextTheme? textTheme = TextTheme(
  bodySmall: TextStyle(
    color: MyColors.grayColor,
    fontSize: 12.sp,
  ),
  bodyMedium: TextStyle(
    color: MyColors.primaryColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold
  ),
  bodyLarge: TextStyle(
    color: MyColors.primaryColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  ),
  titleSmall: TextStyle(
    color: MyColors.grayColor,
    fontSize: 16.sp,
  ),
);

