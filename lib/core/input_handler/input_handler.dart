import 'dart:io';

import 'package:flutrix/core/log/flutrix_logger.dart';

class InputHandler {
  static String askInput(String question, {String defaultValue = ''}) {
    try {
      stdout.write('$question (Default: $defaultValue): ');
      String input = stdin.readLineSync()!;
      return input.isNotEmpty ? input : defaultValue;
    } catch (e) {
      FlutrixLogger.printLogStackTrace('Failed to read user input: $e');
      return defaultValue;
    }
  }

  static bool askConfirmation(String question) {
    try {
      stdout.write('$question (y/n): ');
      String input = stdin.readLineSync()!.toLowerCase();
      switch (input) {
        case 'y':
          return true;
        case 'n':
          return false;
        default:
          FlutrixLogger.printLogError('Invalid input. Please enter "y" or "n".');
          return false;
      }
    } catch (e) {
      FlutrixLogger.printLogStackTrace('Failed to read user input: $e');
      return false;
    }
  }

  static String askForOneInputFromOptions(String question, List<String> options) {
    try {
      stdout.write('$question (Options: ${options.join(', ')}): ');
      String input = stdin.readLineSync()!.toLowerCase();
      if (options.contains(input)) {
        return input;
      } else {
        FlutrixLogger.printLogError('Invalid input. Please enter a valid option.');
        return '';
      }
    } catch (e) {
      FlutrixLogger.printLogStackTrace('Failed to read user input: $e');
      return '';
    }
  }


  static List<String> askForMoreThanOneInputFromOptions(
      String question, List<String> options) {
    try {
      stdout.write('$question (Options: ${options.join(', ')}): ');
      String input = stdin.readLineSync()!.toLowerCase();
      List<String> selected = input.split(' ');
      if (selected.every((element) => options.contains(element))) {
        return selected;
      } else {
        FlutrixLogger.printLogError('Invalid input. Please enter valid options.');
        return [];
      }
    } catch (e) {
      FlutrixLogger.printLogStackTrace('Failed to read user input: $e');
      return [];
    }
  }
  
}