import 'dart:convert';

import 'package:flutter/material.dart';
import 'file:///E:/oufuhui/git/flutter_app/lib/data/mock_api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app/size_config.dart';
import 'file:///E:/oufuhui/git/flutter_app/lib/data/model/mockdata.dart';
import 'package:flutter_app/json/notice.dart';
import 'package:flutter_app/data/remote_service.dart';

class SwiperVerticalPage extends StatefulWidget {
  @override
  SwiperVerticalPageState createState() {
    return SwiperVerticalPageState();
  }
}

class SwiperVerticalPageState extends State<SwiperVerticalPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 120,
      height: 50,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: 3,
        scrollDirection: Axis.vertical,
        autoplay: true,
        onTap: (index) => print('点击了第$index个'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    final newList = [
      '新大陆APP健身预约系统上线啦！',
      '关于2020年中秋节、国庆节放假通知',
      '关于新大陆2021届校招直播带岗主持人征集通知'
    ];

    List list = RemoteService().getNotice()
    return Container(
      alignment: Alignment(-1, 0),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(list[index].title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
