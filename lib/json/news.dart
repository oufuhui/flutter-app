import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'time')
  String time;

  News(this.title,this.url,this.time,);

  factory News.fromJson(Map<String, dynamic> srcJson) => _$NewsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  static List<News> getnewsList(List<dynamic> list){
    List<News> result = [];
    list.forEach((item){
      result.add(News.fromJson(item));
    });
    return result;
  }
}

  
