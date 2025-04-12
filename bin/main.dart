import 'package:flutrix/core/log/flutrix_logger.dart';
import 'package:flutrix/core/services/app_details_service/app_details_service.dart';

void main() async {
  print('''

''');
  try {
    AppDetailsService.getAppDetails();
  } catch (e) {
    FlutrixLogger.printLogStackTrace('Failed to get app details: $e');
  }
}
