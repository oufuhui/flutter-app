import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data/api.dart';
import 'package:flutter_app/data/mock_api.dart';
import 'package:flutter_app/data/model/result.dart';
import 'package:flutter_app/json/notice.dart';

class RemoteService {
  MockApi _api = MockApi();
  static const noticeUrl =
      "https://raw.githubusercontent.com/oufuhui/flutter-resources/master/notice.json";
  static const newsUrl =
      "https://raw.githubusercontent.com/oufuhui/flutter-resources/master/news.json";
  static const picUrl =
      "https://raw.githubusercontent.com/oufuhui/flutter-resources/master/pic.json";

  Future<List<Notice>> getNotice() async {
    Api.request(
      noticeUrl,
      method: "get",
      params: {},
    ).then((value) => null);
    return _api.getNotice().asStream().map((it) => _getData(it)).single;
  }

  getNotice1() async {
    return Future.wait([getNotice(), getNotice()])
        .asStream()
        .reduce((previous, element) => null);
  }

  T _getData<T>(Result<T> result) {
    if (result.code == 0) {
      return result.data;
    } else {
      throw Exception(result.msg ?? "操作失败");
    }
  }
}
