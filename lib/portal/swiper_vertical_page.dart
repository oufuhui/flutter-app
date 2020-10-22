import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/data/mock_api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app/size_config.dart';
import 'package:flutter_app/data/model/mockdata.dart';
import 'package:flutter_app/json/notice.dart';
import 'package:flutter_app/data/remote_service.dart';

class SwiperVerticalPage extends StatefulWidget {
  @override
  SwiperVerticalPageState createState() {
    return SwiperVerticalPageState();
  }
}

class SwiperVerticalPageState extends State<SwiperVerticalPage> {
  RemoteService _dataService = RemoteService();
  List<Notice> notices = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 120,
      height: 50,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: notices.length,
        scrollDirection: Axis.vertical,
        autoplay: true,
        onTap: (index) => print('点击了第$index个'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _dataService.getNotice().then(
        (notices) => {
              setState(() {
                this.notices = notices;
              })
            },
        onError: (error) {});
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return Container(
      alignment: Alignment(-1, 0),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(notices[index].title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
