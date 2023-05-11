import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = const Color.fromRGBO(0, 0, 0, 0)
    ..backgroundColor = Colors.white
    ..radius = 12.w
    ..boxShadow = [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 0.5.w,
        offset: Offset(0.w, 0.5.w),
      ),
    ]
    ..indicatorSize = 34.w
    ..fontSize = 12.sp
    ..indicatorColor = const Color(0xff9e9e9e)
    ..textColor = const Color(0xff3e3e3e)
    ..userInteractions = false
    ..dismissOnTap = false;
  return EasyLoading.show(status: 'Memuat...');
}

Future<void> hideLoading() {
  return EasyLoading.dismiss();
}
