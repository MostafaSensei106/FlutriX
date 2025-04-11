
import 'package:flutrix/cli/prompts.dart';
import 'package:flutrix/config/constants/flutrix_constanst.dart';

void main(List<String> arguments) async {
  print('''

╔════════════════════════════════════════════════════╗
║           ${FlutriXConstanst.cliName}              ║
║       Version: ${FlutriXConstanst.cliVersion}      ║
║       Author: ${FlutriXConstanst.cliAuthor}        ║
║       License: ${FlutriXConstanst.cliLicense}      ║
╚════════════════════════════════════════════════════╝

''');

  // case one phase user use old configuration json file.

  // final oldConfig = await loadConfig();
  // if (oldConfig != null) {
  //   stdout.write('\nDo you want to use the old configuration? (y/n): ');
  //   final usreResponse = stdin.readLineSync()?.toLowerCase();

  //   switch (usreResponse) {
  //     case 'y':
  //     //  await createProject(oldConfig);
  //       break;
  //     case 'n':
  //    //   await createProject(null);
  //       break;
  //     default:
  //       print('Invalid response. Please enter "y" or "n".');
  //   }
  // } else {
  //  // await createProject(null);
  // }

  // case 2 phase user use interactive CLI.
  final config = Prompts().askAppDetails();

  await Prompts().saveConfiglToJsonFile(await config);

  // await previewProjectArchitecture(config);

  // await confirmAndGenerateProject(config);
}
