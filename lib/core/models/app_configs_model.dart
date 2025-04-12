import 'dart:io';

class AppConfigsModel {
  String name;
  String description;
  String pakageName;
  String architecture;

  List<String> targetPlatforms;
  Map<String, dynamic> dependencies;
  List<String> locales;


  AppConfigsModel({
    required this.name,
    required this.description,
    required this.pakageName,
    required this.architecture,
    required this.targetPlatforms,
    required this.locales,
    required this.dependencies,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'appPakageName': pakageName,
    'arch': architecture,
    'targetPlatforms': targetPlatforms,
    'targetLanguages': locales,
    'dependencies': dependencies,
  };

  void printSummary() {
    print('App Name: $name');
    print('App Description: $description');
    print('App Package Name: $pakageName');
    print('App File Structure: $architecture');
    print('Target Platforms: ${targetPlatforms.join(', ')}');
    print('Locales: ${locales.join(', ')}');
    print('Dependencies: ${dependencies.keys.join(', ')}');
  }

  static AppConfigsModel fromJson(Map<String, dynamic> json) => AppConfigsModel(
    name: json['name'],
    description: json['description'],
    pakageName: json['appPakageName'],
    architecture: json['arch'],
    targetPlatforms: json['targetPlatforms'],
    locales: json['targetLanguages'],
    dependencies: json['dependencies'],
  );

}
