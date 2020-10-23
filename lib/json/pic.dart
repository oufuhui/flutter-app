import 'package:json_annotation/json_annotation.dart'; 
  
part 'pic.g.dart';

@JsonSerializable()
  class Pic extends Object {

  @JsonKey(name: 'url')
  String url;

  Pic(this.url,);

  factory Pic.fromJson(Map<String, dynamic> srcJson) => _$PicFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PicToJson(this);

  static List<Pic> getpicList(List<dynamic> list){
    List<Pic> result = [];
    list.forEach((item){
      result.add(Pic.fromJson(item));
    });
    return result;
  }
}

  
