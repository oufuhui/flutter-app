import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data/mock_api.dart';
import 'package:flutter_app/data/model/result.dart';
import 'package:flutter_app/json/notice.dart';

class RemoteService {
  MockApi _api = MockApi();

  Future<List<Notice>> getNotice() async {
    return _api.getNotice().asStream().map((it) => _getData(it)).single;
  }

  getNotice1() async {
    return Future.wait([getNotice(), getNotice()]).asStream().reduce((previous, element) => null);
  }

  T _getData<T>(Result<T> result) {
    if (result.code == 0) {
      return result.data;
    } else {
      throw Exception(result.msg ?? "操作失败");
    }
  }
}
