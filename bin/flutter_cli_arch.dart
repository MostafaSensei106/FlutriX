import 'dart:io';

void main(List<String> arguments) {
  print("\nFlutter Project Architecture Generator");
  print("====================================\n");

  print("Select the desired architecture:");
  print("1. Clean Architecture");
  print("2. Feature-Based Architecture");
  print("3. MVC Architecture");
  print("4. MVVM Architecture");
  print("5. MVP Architecture");
  print("6. MVI Architecture");
  stdout.write("Enter the number: ");
  
  String? choice = stdin.readLineSync();
  
  if (choice == '1') {
    createCleanArchitecture();
  } else if (choice == '2') {
    createFeatureBasedArchitecture();
  } else if (choice == '3') {
    createMVCArchitecture();
  } else if (choice == '4') {
    createMVVMArchitecture();
  } else if (choice == '5') {
    createMVPArchitecture();
  } else if (choice == '6') {
    createMVIArchitecture();
  } else {
    print("Invalid selection! Please try again.");
  }
}

void createCleanArchitecture() {
  final projectPath = "${Directory.current.path}/lib";
  final directories = [
    '$projectPath/core/utils',
    '$projectPath/data/models',
    '$projectPath/data/repositories',
    '$projectPath/data/datasources',
    '$projectPath/domain/entities',
    '$projectPath/domain/repositories',
    '$projectPath/domain/usecases',
    '$projectPath/presentation/pages',
    '$projectPath/presentation/widgets',
  ];

  createDirectories(directories);
}

void createFeatureBasedArchitecture() {
  final projectPath = "${Directory.current.path}/lib/features";
  final directories = [
    '$projectPath/feature1/data/models',
    '$projectPath/feature1/data/repositories',
    '$projectPath/feature1/data/datasources',
    '$projectPath/feature1/domain/entities',
    '$projectPath/feature1/domain/repositories',
    '$projectPath/feature1/domain/usecases',
    '$projectPath/feature1/presentation/pages',
    '$projectPath/feature1/presentation/widgets',
  ];

  createDirectories(directories);
}

void createMVCArchitecture() {
  final projectPath = "${Directory.current.path}/lib/mvc";
  final directories = [
    '$projectPath/models',
    '$projectPath/views',
    '$projectPath/controllers',
  ];

  createDirectories(directories);
}

void createMVVMArchitecture() {
  final projectPath = "${Directory.current.path}/lib/mvvm";
  final directories = [
    '$projectPath/models',
    '$projectPath/views',
    '$projectPath/viewmodels',
  ];

  createDirectories(directories);
}

void createMVPArchitecture() {
  final projectPath = "${Directory.current.path}/lib/mvp";
  final directories = [
    '$projectPath/models',
    '$projectPath/views',
    '$projectPath/presenters',
  ];

  createDirectories(directories);
}

void createMVIArchitecture() {
  final projectPath = "${Directory.current.path}/lib/mvi";
  final directories = [
    '$projectPath/models',
    '$projectPath/views',
    '$projectPath/intents',
    '$projectPath/states',
  ];

  createDirectories(directories);
}

void createDirectories(List<String> directories) {
  for (var dir in directories) {
    final directory = Directory(dir);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      print('Created: $dir ✔');
    } else {
      print('Directory already exists: $dir ');
    }
  }
  print('\n🎉 Directories have been successfully created!\n');
}
