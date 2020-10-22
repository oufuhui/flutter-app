import 'package:json_annotation/json_annotation.dart';

part 'json_result.g.dart';


@JsonSerializable()
class JsonResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  dynamic data;

  JsonResult(this.code,this.msg,this.data,);

  factory JsonResult.fromJson(Map<String, dynamic> srcJson) => _$JsonResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$JsonResultToJson(this);

}


