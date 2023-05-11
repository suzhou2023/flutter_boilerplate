import 'dart:core';

import 'package:flutter/foundation.dart';

//关于时间戳与时区要弄清楚一些概念：
//时间戳是格林尼治时间1970年01月01日00时00分00秒(北京时间1970年01月01日08时00分00秒)起至现在的总秒数
//时间戳与时区没有关系，任何时区的时间戳都是一样的
//下面的DateTime.fromMillisecondsSinceEpoch(timestamp)会将时间戳转换为当地时间（手机系统时区对应的时间）
//测试的时候要注意，在印尼和在中国的时间展示是差一个小时的，将手机调到印尼时区才能看到印尼当地的显示状态
class DateHelper {
  static String timestampToDateStr(int timestamp, String pattern) {
    try {
      return DateTime.fromMillisecondsSinceEpoch(timestamp).toString();
    } catch (e, s) {
      debugPrint(s.toString());
    }
    return '';
  }
}
