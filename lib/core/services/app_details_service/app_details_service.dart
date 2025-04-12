import 'package:flutrix/core/config/constants/flutrix_constants.dart';
import 'package:flutrix/core/input_handler/input_handler.dart';
import 'package:flutrix/core/log/flutrix_logger.dart';
import 'package:flutrix/core/models/app_configs_model.dart';

class AppDetailsService {
 static AppConfigsModel getAppDetails()  {
    final String name = InputHandler.askInput(
      'What is your app name?',
      defaultValue: FlutriXConstanst.cliName,
    );

    final String description = InputHandler.askInput(
      'What is your app description?',
      defaultValue: 'A new Flutter project.',
    );

    final String packageName = InputHandler.askInput(
      'What is your app package name?',
      defaultValue: 'com.example.$name',
    );

    final String architecture = InputHandler.askToSelect(
      'What is your app architecture?',
      FlutriXConstanst.architectureOptions,
    );

    // final List<String> targetPlatforms =
    //     InputHandler.askForMultiSelect(
    //       'What is your app target platforms?',
    //       FlutriXConstanst.platformOptions,
    //     );

    final Map<String, List<String>> dependencies;
    final bool addDepndencies = InputHandler.askConfirmation('Do you want to add Any dependencies?');
    if (addDepndencies){
      dependencies = InputHandler.askForMuiltiDependency();
    } else {
      dependencies = {} as Map<String, List<String>>;
    }

    final List<String> locales;
    final bool addLocales = InputHandler.askConfirmation('Do you want to add locales?');
    if (addLocales) {
      locales = InputHandler.askForMultiInput(
        'What is your app target locales?',
        example: 'ar, en, fr',
      );
    } else {
      locales = [];
    }
    
    final AppConfigsModel configs = AppConfigsModel(
      name: name,
      description: description,
      packageName: packageName,
      architecture: architecture,
    //  targetPlatforms: targetPlatforms,
      locales: locales,
      dependencies: dependencies,
    );

    FlutrixLogger.printLogInfo('App details: $configs');
    return configs;
  }

    

  }

