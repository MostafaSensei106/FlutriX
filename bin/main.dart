import 'package:flutrix/core/config/constants/flutrix_constants.dart';
import 'package:flutrix/core/services/app_details_service/app_details_service.dart';

void main() async {
  print('''
╔════════════════════════════════════════════════════╗
║           ${FlutriXConstanst.cliName}              ║
║       Version: ${FlutriXConstanst.cliVersion}      ║
║       Author: ${FlutriXConstanst.cliAuthor}        ║
║       License: ${FlutriXConstanst.cliLicense}      ║
╚════════════════════════════════════════════════════╝
''');
  AppDetailsService.getAppDetails();
}
