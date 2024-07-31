import 'package:archive_app/core/imports/app_imports/app_imports.dart';

enum ColorState{
  success,
  error,
}
Color chooseSnackColor(ColorState state) {
  Color color;
  switch (state) {
    case ColorState.success:
      color = MyColors.primaryColor;
      break;
    case ColorState.error:
      color = MyColors.redColor;
      break;
    default:
      return Colors.amber;
  }
  return color;
}