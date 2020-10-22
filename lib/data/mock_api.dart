import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class MockApi {
  Future<String> loadJson(String fileName) async {
    return await rootBundle.loadString("assets/json/${fileName}.json");
  }

  Future<dynamic> getNotice() async {
    String jsonStr = await loadJson("notice");
    return json.decode(jsonStr);
  }
}
