import 'package:flutrix/core/config/constants/flutrix_constants.dart';
import 'package:flutrix/core/models/app_configs_model.dart';
import 'package:flutrix/core/services/app_details_service/app_details_service.dart';
import 'package:flutrix/core/services/save_appdetails_tojson/save_appdetails_tojson.dart';

void main() async {
  print('''
╔════════════════════════════════════════════════════╗
            ${FlutriXConstanst.cliName}                 
        Version: ${FlutriXConstanst.cliVersion}         
        Author: ${FlutriXConstanst.cliAuthor}           
        License: ${FlutriXConstanst.cliLicense}         
╚════════════════════════════════════════════════════╝
''');
 final AppConfigsModel appDetails = AppDetailsService.getAppDetails();

 SaveAppdetailsTojson.saveAppDetailsToJson(appDetails);



}
