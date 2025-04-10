import 'dart:io';

import 'package:flutrix/config/constants/flutrix_constanst.dart';
import 'package:flutrix/models/project_config_model.dart';

Future<AppModel> askAppDetails() async {
  print('Welcome to Flutrix CLI!');
  print('====================================');

  stdout.write('What is the name of your app? (Default: flutrix) : ');
  String name = stdin.readLineSync() ?? FlutriXConstanst.cliName;
  stdout.write('What is the description of your app? (Default: A new Flutter project.) : ');
  String description = stdin.readLineSync() ?? FlutriXConstanst.cliDescription;

  
  stdout.write('What is the package name of your app? (Default: com.${FlutriXConstanst.cliAuthor}.$name) : ');
  String appPakageName = stdin.readLineSync() ?? 'com.${FlutriXConstanst.cliAuthor}.$name';

  print('Select the target platforms: ');
  for (var option in FlutriXConstanst.platformOptions) {
    print(option);
  }
  stdout.write('Enter the number(s) separated by spaces: ');
  List<String> targetPlatforms = stdin.readLineSync()!.split(' ').map((e) => FlutriXConstanst.platformOptions[int.parse(e) - 1].split(' ')[1]).toList();
  print('Selected platforms: ${targetPlatforms.join(', ')}');

  return AppModel(name: name, description: description, appPakageName: appPakageName, arch: 'clean', targetPlatforms: targetPlatforms, targetLanguages: ['dart'], dependencies: []);
}

void main() async {
  await askAppDetails();
  print('All done!');
  
}