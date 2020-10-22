import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_app/json/json_result.dart';
import 'package:flutter_app/json/notice.dart';

import 'package:flutter_app/json/notice.dart';
import 'package:flutter_app/json/json_result.dart';
import 'package:flutter_app/data/model/result.dart';

class MockApi {
  Future<String> loadJson(String fileName) async {
    return await rootBundle.loadString("assets/json/${fileName}.json");
  }

  Future<Result<List<Notice>>> getNotice() async {
    String jsonStr = await loadJson("notice");
    JsonResult jsonResult = JsonResult.fromJson(json.decode(jsonStr));
    return Result(jsonResult, Notice.getnoticeList(jsonResult.data));
  }

}
