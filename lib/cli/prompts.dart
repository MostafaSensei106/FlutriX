import 'dart:io';

import 'package:flutrix/config/constants/flutrix_constanst.dart';
import 'package:flutrix/models/project_config_model.dart';

String _askName() {
  stdout.write('What is the name of your app? (Default: flutrix): ');
  return stdin.readLineSync() ?? FlutriXConstanst.cliName;
}

String _askDescription() {
  stdout.write(
    'What is the description of your app? (Default: A new Flutter project.): ',
  );
  return stdin.readLineSync() ?? FlutriXConstanst.cliDescription;
}

String _askPackageName(String name) {
  stdout.write(
    'What is the package name of your app? (Default: com.${FlutriXConstanst.cliAuthor}.$name): ',
  );
  return stdin.readLineSync() ?? 'com.${FlutriXConstanst.cliAuthor}.$name';
}

List<String> _askTargetPlatforms() {
  print('Available platforms:');
  for (var i = 0; i < FlutriXConstanst.platformOptions.length; i++) {
    print('${i + 1}. ${FlutriXConstanst.platformOptions[i]}');
  }
  stdout.write('Enter the number(s) separated by spaces (Default: 1.All): ');
  List<String> targetPlatforms = stdin
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

List<Map<String, dynamic>> _askDependencies() {
  print('Do you want to add any dependencies? (y/n): ');
  String response = stdin.readLineSync()!.toLowerCase();
  switch (response) {
    case 'y':
      stdout.write(
        'Enter the dependencies separated by spaces (example:flutter_bloc: ^8.0.1): ',
      );
      List<String> dependencies = stdin.readLineSync()!.split(' ');
      return [
        {'name': dependencies[0], 'version': dependencies[1]},
      ];
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
      stdout.write('Enter the locales separated by spaces (example: en, fr): ');
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

AppModel _createAppModel(
  String name,
  String description,
  String packageName,
  List<String> targetPlatforms,
  String arch,
  List<String> locales,
  List<Map<String, dynamic>> dependencies,
) {
  return AppModel(
    name: name,
    description: description,
    appPakageName: packageName,
    arch: arch,
    targetPlatforms: targetPlatforms,
    targetLanguages: locales,
    dependencies: dependencies,
  );
}

Future<AppModel> askAppDetails() async {
  String name = _askName();
  String description = _askDescription();
  String packageName = _askPackageName(name);
  List<String> targetPlatforms = _askTargetPlatforms();
  String arch = _askTargetArchitecture();
  List<Map<String, dynamic>> dependencies = _askDependencies();
  List<String> locales = _askLocales();
  return _createAppModel(
    name,
    description,
    packageName,
    targetPlatforms,
    arch,
    locales,
    dependencies,
  );
}

void main() async {
  await askAppDetails();
  print('All done!');
}
