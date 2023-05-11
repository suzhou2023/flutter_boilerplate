import 'log.dart';

String? numberToCurrency(int? number) {
  if (number == null) return null;
  return 'Rp ${number.toString().replaceAll(RegExp(r'(?=(\B\d{3})+$)'), '.')}';
}

int? stringToInt(String? src) {
  String numStr = src?.replaceAll(RegExp(r'\D'), '') ?? '';
  if (numStr.isNotEmpty) {
    try {
      return int.parse(numStr);
    } catch (e) {
      Log.e('$e');
    }
  }
  return null;
}

String? numberToServiceTime(int? bulan) {
  if (bulan == null) return null;
  return '${(bulan / 12).floor()} Tahun, ${bulan % 12} Bulan';
}

int serviceTimeToNumber(String? time) {
  try {
    final arr = time?.split(',') ?? [];
    if (arr.length == 2) {
      final year = int.parse(arr[0].replaceAll(RegExp(r'\D'), ''));
      final month = int.parse(arr[1].replaceAll(RegExp(r'\D'), ''));
      return year * 12 + month;
    }
  } catch (e) {
    Log.e('$e');
  }
  return 0;
}
