import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:flutrix/core/models/app_configs_model.dart';

class SaveAppdetailsTojson {
  static void saveAppDetailsToJson(AppConfigsModel appDetails) {
    final json = appDetails.toJson();
    final jsonString = jsonEncode(json);
    final now = DateTime.now();
    final fileName =
        'FlutriX_Config_${DateFormat('yyyy-MM-dd_HH').format(now)}.json';
    final file = File(fileName);
    file.writeAsStringSync(jsonString);
  }
}

