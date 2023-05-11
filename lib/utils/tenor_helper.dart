import 'package:flutter/foundation.dart';

String tenorInWords(String? tenor) {
  if (tenor == null) return '';
  try {
    int tenorNumber = int.parse(tenor.substring(0, tenor.length - 1));
    String tenorUnit = tenor.substring(tenor.length - 1, tenor.length);
    switch (tenorUnit) {
      case 'D':
        return '$tenorNumber Hari';
      case 'W':
        return '$tenorNumber Minggu';
      case 'M':
        return '$tenorNumber Bulan';
      case 'Y':
        return '$tenorNumber Tahun';
      default:
        return tenor;
    }
  } catch (e, s) {
    debugPrint(s.toString());
  }
  return '';
}

String currentPeriod(int duePeriod, String tenor) {
  try {
    int tenorNumber = int.parse(tenor.substring(0, tenor.length - 1));
    String tenorUnit = tenor.substring(tenor.length - 1, tenor.length);
    if (tenorUnit == 'D') {
      tenorNumber = 1;
    }
    return '$duePeriod dari $tenorNumber';
  } catch (e, s) {
    debugPrint(s.toString());
  }
  return '';
}
