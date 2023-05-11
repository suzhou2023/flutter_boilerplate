import 'dart:io';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

final logger = Logger(
  printer: PrettyPrinter(),
  // output: FileOutput(
  //   file: File(
  //     'out.log',
  //   ),
  // ),
);

class Log {
  static void init() {
    Logger.level = Level.debug;
  }

  static void v(dynamic message) => logger.v(message);

  static void d(dynamic message) {
    logger.d(message);
  }

  static void i(dynamic message) => logger.i(message);

  static void w(dynamic message) => logger.w(message);

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      logger.e(message, error, stackTrace);

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  String getFileDate() {
    final now = DateTime.now();
    final String today = now.year.toString() +
        ((now.month < 9) ? '0' : '') +
        now.month.toString() +
        ((now.day < 9) ? '0' : '') +
        now.day.toString();
    return today;
  }

  Future<File> get localFile async {
    final path = await _localPath;
    return File('$path/log-${getFileDate()}.txt');
  }

  Future<void> writeLog(String data) async {
    final file = await localFile;
    final slink = file.openWrite(mode: FileMode.append);
    // Write the file.
    final now = DateTime.now();
    slink.write('(edu_student) $now $data\n');
    slink.close();
    return;
  }
}
