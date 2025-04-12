import 'package:logger/logger.dart';

class FlutrixLogger {
  
  var logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat:DateTimeFormat.dateAndTime,
    ),
  );

  static void printLogInfo(String message) {
    FlutrixLogger().logger.i(message);
  }

  static void printLogWarning(String message) {
    FlutrixLogger().logger.w(message);
  }

  static void printLogError(String message) {
    FlutrixLogger().logger.e(message);
  }

  static void printLogVerbose(String message) {
    FlutrixLogger().logger.t(message);
  }

  static void printLogDebug(String message) {
    FlutrixLogger().logger.d(message);
  }

  static void printLogStackTrace(String message) {
    FlutrixLogger().logger.f(message);
  }
}

