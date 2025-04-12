import 'dart:convert';
import 'dart:io';

import 'package:flutrix/core/config/constants/flutrix_constanst.dart';
import 'package:flutrix/models/app_configs_model.dart';

class Prompts {
  String _askName() {
    stdout.write('What is the name of your app? (Default: flutrix.): ');
    return (stdin.readLineSync() ?? FlutriXConstanst.cliName).toLowerCase();
  }

  String _askDescription() {
    stdout.write(
      'What is the description of your app? (Default: A new Flutter project.): ',
    );
    return stdin.readLineSync() ?? FlutriXConstanst.cliDescription;
  }

  String _askPackageName(String name) {
    stdout.write(
      'What is the package name of your app? (Default: com.example.$name): ',
    );
    return (stdin.readLineSync() ?? 'com.example.$name').toLowerCase();
  }

  List<String> _askTargetPlatforms() {
    print('Available platforms:');
    for (var i = 0; i < FlutriXConstanst.platformOptions.length; i++) {
      print('${i + 1}. ${FlutriXConstanst.platformOptions[i]}');
    }
    stdout.write('Enter the number(s) separated by spaces (Default: 1.All.): ');
    List<String> targetPlatforms =
        stdin
            .readLineSync()!
            .split(' ')
            .map((e) => FlutriXConstanst.platformOptions[int.parse(e) - 1])
            .toList();
    print('Selected platforms: ${targetPlatforms.join(', ')}');
    return targetPlatforms;
  }

  String _askTargetArchitecture() {
    print('Available architectures:');
    for (var arch in FlutriXConstanst.architectureOptions) {
      print('${FlutriXConstanst.architectureOptions.indexOf(arch) + 1}. $arch');
    }
    stdout.write('Enter the number of the architecture: ');
    int archIndex = int.parse(stdin.readLineSync()!);
    String arch =
        FlutriXConstanst.architectureOptions[archIndex - 1].split(' ')[1];
    print('Selected architecture: $arch');
    return arch;
  }

  List<String> _askDependencies() {
    print('Do you want to add any dependencies? (y/n): ');
    String response = stdin.readLineSync()!.toLowerCase();
    switch (response) {
      case 'y':
        stdout.write(
          'Enter the dependencies separated by spaces (example:flutter_bloc flutter_riverpod): ',
        );
        List<String> dependencies = stdin.readLineSync()!.split(' ');
        return dependencies;
      case 'n':
        print('No dependencies added.');
        return [];
      default:
        print('Invalid response. Please enter "y" or "n".');
        return [];
    }
  }

  List<String> _askLocales() {
    print('Do you want to add any locales? (y/n): ');
    String response = stdin.readLineSync()!.toLowerCase();
    switch (response) {
      case 'y':
        stdout.write(
          'Enter the locales separated by spaces (example: en fr de): ',
        );
        List<String> locales = stdin.readLineSync()!.split(' ');
        return locales;
      case 'n':
        print('No locales added.');
        return [];
      default:
        print('Invalid response. Please enter "y" or "n".');
        return [];
    }
  }

  AppConfigsModel _createAppModel(
    String name,
    String description,
    String packageName,
    String arch,
    List<String> locales,
    List<String> targetPlatforms,

    List<String> dependencies,
  ) {
    return AppConfigsModel(
      name: name,
      description: description,
      appPakageName: packageName,
      arch: arch,
      targetPlatforms: targetPlatforms,
      targetLanguages: locales,
      dependencies: dependencies,
    );
  }

  Future<AppConfigsModel> askAppDetails() async {
    String name = _askName();
    String description = _askDescription();
    String packageName = _askPackageName(name);
    String arch = _askTargetArchitecture();
    List<String> targetPlatforms = _askTargetPlatforms();
    List<String> dependencies = _askDependencies();
    List<String> locales = _askLocales();
    AppConfigsModel config = _createAppModel(
      name,
      description,
      packageName,
      arch,
      targetPlatforms,
      locales,
      dependencies,
    );
    return config;
  }

  Future<void> saveConfiglToJsonFile(AppConfigsModel config) async {
    final now = DateTime.now();
    final formattedNow =
        '${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}${now.isBefore(DateTime(now.year, now.month, now.day, 12)) ? 'AM' : 'PM'}';
    final file = File('flutrix_$formattedNow.json');
    await file.writeAsString(jsonEncode(config.toJson()));
  }
}
