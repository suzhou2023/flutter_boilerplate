import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingHelper {
  static showLoading(BuildContext context, CancelToken? cancelToken,
      {bool loadingCancelable = false}) {}

  static hideLoading(BuildContext context) {}

  static showEasyLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..maskType = EasyLoadingMaskType.custom
      ..maskColor = const Color.fromRGBO(0, 0, 0, 0.5)
      ..indicatorSize = 40.0
      ..radius = 6
      ..backgroundColor = Colors.white
      ..indicatorColor = const Color(0XFF29a4dd)
      ..textColor = Colors.black87
      ..textStyle = const TextStyle(fontSize: 14)
      ..userInteractions = false
      ..dismissOnTap = false;
    EasyLoading.show(status: 'Memuat...');
  }

  static dismissEasyLoading() {
    EasyLoading.dismiss();
  }
}
