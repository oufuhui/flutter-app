import 'dart:convert';

import 'package:flutter_app/data/api.dart';
import 'package:flutter_app/data/mock_api.dart';
import 'package:flutter_app/data/model/result.dart';
import 'package:flutter_app/data/viewmodel/news_viewmodel.dart';
import 'package:flutter_app/data/viewmodel/notices_viewmodel.dart';
import 'package:flutter_app/data/viewmodel/pic_viewmodel.dart';
import 'package:flutter_app/data/viewmodel/portal_viewmodel.dart';
import 'package:flutter_app/json/news.dart';
import 'package:flutter_app/json/notice.dart';
import 'package:flutter_app/json/json_result.dart';
import 'package:flutter_app/json/pic.dart';

class RemoteService {
  MockApi _api = MockApi();

  Future<NoticeViewModel> getNotice() async {
    return _api.getNotice().asStream().map((it) {
      List<Notice> notices = _getData(it);
      return NoticeViewModel(notices);
    }).single;
  }

  Future<NewsViewModel> getNews() async {
    return _api.getNews().asStream().map((it) {
      List<News> news = _getData(it);
      return NewsViewModel(news);
    }).single;
  }

  Future<PicViewModel> getPic() async {
    return _api.getPic().asStream().map((it) {
      List<Pic> pics = _getData(it);
      return PicViewModel(pics);
    }).single;
  }

  Future<PortalViewModel> getPortalViewModel() async {
    return Future.wait([getNotice(), getNews(), getPic()]).asStream().map((it) {
      PortalViewModel portalViewModel = PortalViewModel();
      it.forEach((item) {
        if (item is NewsViewModel) {
          portalViewModel.news = (item as NewsViewModel).news;
        }
        if (item is NoticeViewModel) {
          portalViewModel.notices = (item as NoticeViewModel).notices;
        }
        if (item is PicViewModel) {
          portalViewModel.pics = (item as PicViewModel).pics;
        }
      });
      return portalViewModel;
    }).single;
  }

  T _getData<T>(Result<T> result) {
    if (result.code == 0) {
      return result.data;
    } else {
      throw Exception(result.msg ?? "操作失败");
    }
  }
}
