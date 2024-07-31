import 'package:archive_app/core/imports/app_imports/app_imports.dart';

ThemeData themeDataDarkEnglish() => ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      // primaryColor: Colors.grey.shade300,
      // colorSchemeSeed: MyColors.primaryColor,
      colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark,
          background: MyColors.scaffoldColorDark,
          primary: MyColors.primaryColor,
          secondary: MyColors.lightGrayColor,
          primaryContainer: MyColors.containerColorDark,
          secondaryContainer: MyColors.containerColorDark,
          error: MyColors.redColor,
          onPrimary: MyColors.whiteColor),
      fontFamily: 'Roboto',
      textTheme: darkTextTheme,
      datePickerTheme: DatePickerThemeData(
        yearForegroundColor: const MaterialStatePropertyAll(MyColors.whiteColor),
        yearStyle: TextStyle(
          fontSize: 16.sp,
        ),
      ),
    );

ThemeData themeDataDarkArabic() => ThemeData(
      useMaterial3: true,
      // primaryColor: Colors.grey.shade300,
      // colorSchemeSeed: MyColors.primaryColor,
      scaffoldBackgroundColor: MyColors.scaffoldColorDark,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.dark,
        background: MyColors.scaffoldColorDark,
        primary: MyColors.primaryColor,
        secondary: MyColors.lightGrayColor,
        primaryContainer: MyColors.containerColorDark,
        secondaryContainer: MyColors.containerColorDark,
        error: MyColors.redColor,
        onPrimary: MyColors.whiteColor
      ),
      fontFamily: 'NotoNaskhArabic',
      textTheme: darkTextTheme,
      datePickerTheme: DatePickerThemeData(
        yearForegroundColor: const MaterialStatePropertyAll(MyColors.whiteColor),
        yearStyle: TextStyle(
          fontSize: 16.sp,
        ),
      ),
    );

TextTheme? darkTextTheme = TextTheme(
  bodySmall: TextStyle(
    color: MyColors.whiteColor,
    fontSize: 12.sp,
  ),
  bodyMedium: TextStyle(
      color: MyColors.whiteColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold),
  bodyLarge: TextStyle(
    color: MyColors.primaryColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  ),
  titleSmall: TextStyle(
    color: MyColors.lightGrayColor,
    fontSize: 16.sp,
  ),
);
