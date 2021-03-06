import 'package:flutter/foundation.dart';

/// A system wide logger that can be accessed from anywhere.
///
/// todo..
abstract class Logger {
  static const AppName = "AITranslator";

  static void logDebug(String message, [Type sender]){
    log(message, LogLevel.DEBUG, sender);
  }

  static void logInformative(String message, [Type sender]){
    log(message, LogLevel.INFO, sender);
  }

  static void logWarning(String message, [Type sender]){
    log(message, LogLevel.WARNING, sender);
  }

  static void logCritical(String message, [Type sender]){
    log(message, LogLevel.CRITICAL, sender);
  }

  ///Writes a log message to the console and to a log file.
  static void log(String message, [LogLevel logLevel = LogLevel.DEBUG, Type sender]){
    var dt = new DateTime.now();
    var timeFormatted = "${dt.hour}:${dt.minute}:${dt.second}";
    String fullMessage;
    var senderString = sender.toString();
    if(sender.toString() == "" || sender == null) {
      fullMessage = '[$AppName] [$timeFormatted] [$logLevel] $message';
    } else{
      fullMessage = '[$AppName] [$timeFormatted] [$logLevel] [$senderString] $message';
    }
    if(logLevel == LogLevel.DEBUG && kReleaseMode){
      return;
    }
    print(fullMessage);
  }
}

enum LogLevel {
  DEBUG,
  INFO,
  WARNING,
  CRITICAL
}