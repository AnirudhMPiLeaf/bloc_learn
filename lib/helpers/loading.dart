import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingHelper {
  LoadingHelper._();
  static void showLoading({String? text}) {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.clear,
      status: text,
      indicator: const CircularProgressIndicator.adaptive(),
      dismissOnTap: true,
    );
  }
}
