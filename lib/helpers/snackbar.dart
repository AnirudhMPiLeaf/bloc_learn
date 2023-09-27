import 'package:bloc_learn/helpers/colors.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
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
          duration: duration ?? const Duration(milliseconds: 500),
          content: Container(
            height: height ?? 100,
            alignment: alignment ?? Alignment.center,
            child: content,
          ),
          backgroundColor: backgroundColor ?? AppColors.baseColorDark,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      );
  }
}
