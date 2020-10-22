import 'package:json_annotation/json_annotation.dart';

part 'notice.g.dart';

@JsonSerializable()
class Notice extends Object {

  @JsonKey(name: 'title')
  String title;

  Notice(this.title,);

  factory Notice.fromJson(Map<String, dynamic> srcJson) => _$NoticeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NoticeToJson(this);

  static List<Notice> getnoticeList(List<dynamic> list){
    List<Notice> result = [];
    list.forEach((item){
      result.add(Notice.fromJson(item));
    });
    return result;
  }
}


