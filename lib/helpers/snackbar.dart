import 'package:bloc_learn/helpers/colors.dart';
import 'package:bloc_learn/helpers/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackBarHelper {
  SnackBarHelper._();

  static GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackbar(
    Widget content, {
    Duration? duration,
    Color? backgroundColor,
    Alignment? alignment,
    double? height,
  }) {
    key.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration:
              duration ?? const Duration(milliseconds: AppValues.lowDuration),
          content: Container(
            height: height ?? AppValues.snackbarHeight,
            alignment: alignment ?? Alignment.center,
            child: content,
          ),
          margin: EdgeInsets.only(
            bottom: ScreenUtil().screenHeight - 100,
            left: 10,
            right: 10,
          ),
          backgroundColor: backgroundColor ?? AppColors.transparentColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      );
  }
}
