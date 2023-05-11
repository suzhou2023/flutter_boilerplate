import 'dart:convert';

class JsonHelper {
  static const JsonEncoder _encoder = JsonEncoder.withIndent('  ');
  // object必须是可序列化的
  // 1. [num], [String], [bool], and [Null]
  // 2. [List], 其元素必须可序列化
  // 3. [Map], key必须是String，value必须可序列化
  // 4. 一般的object, 但必须实现toJson方法
  static String encode(Object object) {
    return jsonEncode(object);
  }

  static dynamic decode(String json) {
    return jsonDecode(json);
  }

  // object必须是可序列化的
  // 1. [num], [String], [bool], and [Null]
  // 2. [List], 其元素必须可序列化
  // 3. [Map], key必须是String，value必须可序列化
  // 4. 一般的object, 但必须实现toJson方法
  static String convert(Object object) {
    return _encoder.convert(object);
  }
}
