import 'package:flutter_app/json/json_result.dart';

class Result<T> {
  T data;
  int code;
  String msg;

  Result(JsonResult jsonResult, this.data) {
    this.code = jsonResult.code;
    this.msg = jsonResult.msg;
  }
}
