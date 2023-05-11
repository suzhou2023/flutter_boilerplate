import 'package:flutter/material.dart';

// ignore: unused_import
import 'log.dart';

class Rules {
  static const String notEmpty = r'\S';
  static const String number = r'^\d+$';
  static const String numberPassword = r'^\d{6}$';
  static const String email = r'^[\w.\-]+@(?:[a-z0-9]+(?:-[a-z0-9]+)*\.)+[a-z]{2,3}$';
}

const defaultErrMsg = 'Mohon lengkapi data';

FormFieldValidator<String> _validator<T>(String rule) {
  return (String? value) {
    // Log.d('validate: $value');
    final ret = RegExp(rule).hasMatch(value ?? '');
    if (ret) return null;
    return defaultErrMsg;
  };
}

class Validators {
  static final notEmpty = _validator(Rules.notEmpty);
  static final number = _validator(Rules.number);
  static final numberPassword = _validator(Rules.numberPassword);
  static final email = _validator(Rules.email);
}
