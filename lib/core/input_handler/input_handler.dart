import 'package:flutrix/core/log/flutrix_logger.dart';
import 'package:interact_cli/interact_cli.dart';

class InputHandler {
  static String askInput(String question, {String defaultValue = ''}) {
    try {
      return Input(
        prompt: question,
        defaultValue: defaultValue,
        initialText: defaultValue,
      ).interact();
    } catch (e) {
      FlutrixLogger.printLogStackTrace('Failed to read user input: $e');
      return defaultValue;
    }
  }

  static List<String> askForMultiInput(String question , {String example = ''}) {
    try {
      final input = askInput(question, defaultValue: example);
      return input.split(' ').where((element) => element.isNotEmpty).toList();
    } catch (e) {
      FlutrixLogger.printLogStackTrace('Failed to read user input: $e');
      return [];
    }
  }


  static Map<String, List<String>> askForMuiltiDependency() {
    try {
      final input = askInput('What are your app dependencies? (example: flutter: ^2.0.0 flutter_test: ^2.0.0)');
      return Map.fromEntries(input
          .split(' ')
          .where((element) => element.isNotEmpty)
          .map((e) {
            final parts = e.split(':');
            return MapEntry(parts[0], parts.length > 1 ? parts.skip(1).toList() : []);
          }));
    } catch (e) {
      FlutrixLogger.printLogStackTrace('Failed to read user input: $e');
      return {};
    }
  }

  static bool askConfirmation(String question) {
    try {
      final result = Confirm(prompt: question).interact();
      return result;
    } catch (e) {
      FlutrixLogger.printLogStackTrace('Failed to read user input: $e');
      return false;
    }
  }

  // static List<String> askForMultiSelect(
  //   String question,
  //   List<String> options, {
  //   String defaultValue = '',
  // }) {
  //   try {
  //     final indexes = MultiSelect(
  //       prompt: question,
  //       options: options,
  //       allowMultiple: true,
  //       defaultValue: defaultValue.isNotEmpty
  //           ? options
  //               .asMap()
  //               .entries
  //               .where((element) => defaultValue.split(' ').contains(element.value))
  //               .map((e) => e.key)
  //               .toList()
  //           : [],
  //     ).interact();
  //     return indexes.map((i) => options[i]).toList();
  //   } catch (e) {
  //     FlutrixLogger.printLogStackTrace('Failed to read user input: $e');
  //     return [];
  //   }
  // }

  static String askToSelect(
    String question,
    List<String> options,
  ) {
    try {
      final int selection =
          Select(prompt: question, options: options).interact();
      return options[selection];
    } catch (e) {
      FlutrixLogger.printLogStackTrace('Failed to read user input: $e');
      return '';
    }
  }


}
