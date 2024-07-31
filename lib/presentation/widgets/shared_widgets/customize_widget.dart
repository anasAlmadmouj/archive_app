import 'package:archive_app/core/constants/colors/my_colors.dart';
import 'package:archive_app/core/imports/app_imports/app_imports.dart';
import 'package:flutter/cupertino.dart';

PreferredSizeWidget customizedAppBar({
  required VoidCallback? function,
  IconData? icon = Icons.arrow_back_ios_new_outlined,
  Color? colorIcon = MyColors.primaryColor,
  required String? title,
  required BuildContext context,
}) =>
    AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      leading: IconButton(onPressed: function, icon: FaIcon(icon ?? FontAwesomeIcons.arrowLeft , color: colorIcon,)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            '$title',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.primaryColor,
              fontSize: 20,
            ),
          ),
        ),
      ],
      elevation: 0,
    );

Widget defaultElevatedButton({
  Color? backGroundColor,
  double? height = 50.0,
  double? width = double.infinity,
  VoidCallback? function,
  String? text,
  double? borderRadius = 0.0,
  double? fontSize = 18.0,
  Color? colorText = Colors.white,
}) =>
    SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(backGroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
          ),
        ),
        onPressed: function,
        child: Text(
          "$text".toUpperCase(),
          style: TextStyle(
            color: colorText,
            fontSize: fontSize,
          ),
        ),
      ),
    );