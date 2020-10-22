// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonResult _$JsonResultFromJson(Map<String, dynamic> json) {
  return JsonResult(
      json['code'] as int, json['msg'] as String, json['data'] as String);
}

Map<String, dynamic> _$JsonResultToJson(JsonResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data
    };
