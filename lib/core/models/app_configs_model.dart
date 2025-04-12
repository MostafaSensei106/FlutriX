
class AppConfigsModel {
  String name;
  String description;
  String packageName;
  String architecture;

  List<String> targetPlatforms;
  Map<String, List<String>> dependencies;
  List<String> locales;

  AppConfigsModel({
    required this.name,
    required this.description,
    required this.packageName,
    required this.architecture,
    required this.targetPlatforms,
    required this.locales,
    required this.dependencies,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'appPakageName': packageName,
    'arch': architecture,
    'targetPlatforms': targetPlatforms,
    'targetLanguages': locales,
    'dependencies': dependencies,
  };

  static AppConfigsModel fromJson(Map<String, dynamic> json) => AppConfigsModel(
    name: json['name'],
    description: json['description'],
    packageName: json['appPakageName'],
    architecture: json['arch'],
    targetPlatforms: json['targetPlatforms'],
    locales: json['targetLanguages'],
    dependencies: json['dependencies'],
  );
}
