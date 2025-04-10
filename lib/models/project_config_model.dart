class AppModel {
  String name;
  String description;
  String appPakageName;
  String arch;

  List<String> targetPlatforms;
  List<String> targetLanguages;
  List<Map<String, dynamic>> dependencies;

  AppModel({
    required this.name,
    required this.description,
    required this.appPakageName,
    required this.arch,
    required this.targetPlatforms,
    required this.targetLanguages,
    required this.dependencies,
  });


  Map<String,dynamic> toJson() => {
    'projectName': name,
    'projectDescription': description,
    'projectPakageName': appPakageName,
    'projectArchitecture': arch,
    'targetsPlatforms': targetPlatforms,
    'targetsLanguages': targetLanguages,
    'pubDependencies': dependencies,
  };


  static AppModel fromJson(Map<String,dynamic> json) => AppModel(
    name: json['name'],
    description: json['description'],
    appPakageName: json['appPakageName'],
    arch: json['arch'],
    targetPlatforms: json['targetPlatforms'],
    targetLanguages: json['targetLanguages'],
    dependencies: json['dependencies'],
  );


}
