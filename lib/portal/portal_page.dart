import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/news_item.dart';
import 'package:flutter_app/data/model/portal_item.dart';
import 'package:flutter_app/size_config.dart';
import 'swiper_page.dart';
import 'swiper_vertical_page.dart';

class PortalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PortalContent(),
    );
  }
}

class PortalContent extends StatelessWidget {
  final List<PortalItem> portalItems = [
    PortalItem(title: "商旅服务", icon: Icons.work_outlined),
    PortalItem(title: "移动考勤", icon: Icons.access_time_outlined),
    PortalItem(title: "流程中心", icon: Icons.assignment),
    PortalItem(title: "工作邮箱", icon: Icons.email),
    PortalItem(title: "文件中转站", icon: Icons.attach_email_outlined),
    PortalItem(title: "新闻中心", icon: Icons.art_track_sharp),
    PortalItem(title: "访客系统", icon: Icons.account_circle_rounded),
    PortalItem(title: "名企微贷", icon: Icons.widgets),
    PortalItem(title: "益农商城", icon: Icons.account_balance_outlined),
    PortalItem(title: "健康上报", icon: Icons.add_comment_outlined)
  ];

  final List<NewsItem> newsItems = [
    NewsItem(
        title: "福建省数字经济重大项目集中签约——新大陆与邵武市人民政府、卓理股份有限公司签订三方协议",
        time: "2020-10-15 08:55:55"),
    NewsItem(
        title: "新大陆承建——福建“农业云131”项目惊艳亮相第三届“数字中国”成果展",
        time: "2020-10-15 08:55:55"),
    NewsItem(
        title: "打造“数字中国”的先锋示范区 ——王晶在第三届数字中国建设峰会“数字福建”分论坛上的演讲",
        time: "2020-10-15 08:55:55"),
    NewsItem(
        title: "新时代、新基建——CTID平台亮相第三届数字中国建设峰会", time: "2020-10-15 08:55:55"),
    NewsItem(
        title: "CTID“网证+”场景亮相峰会，新大陆助力共建数字身份新生态", time: "2020-10-15 08:55:55"),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RefreshIndicator(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              stretch: false,
              expandedHeight: 160.0,
              backgroundColor: Colors.blue,
              flexibleSpace: FlexibleSpaceBar(
                background: TitleContent(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("公告",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600)),
                        SwiperVerticalPage(),
                        Expanded(
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                onPressed: null))
                      ],
                    ),
                  ),
                );
              }, childCount: 1),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.8,
                  crossAxisCount: 5),
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = portalItems[index];
                return PluginButton(
                  title: item.title,
                  iconData: item.icon,
                );
              }, childCount: portalItems.length),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return SwiperPage();
            }, childCount: 1)),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = newsItems[index];
                return NewListContent(title: item.title, time: item.time);
              },
              childCount: 5,
            ))
          ],
        ),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            return;
          });
        });
  }
}

class NewListContent extends StatelessWidget {
  final String title;
  final String time;

  const NewListContent({Key key, this.title, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/test.png',
              height: 60, width: 80, fit: BoxFit.cover),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Text(time),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewListView1 extends StatelessWidget {
  final List<String> titleItems = <String>[
    '福建省数字经济重大项目集中签约——新大陆与邵武市人民政府、卓理股份有限公司签订三方协议',
    '新大陆承建——福建“农业云131”项目惊艳亮相第三届“数字中国”成果展',
    '打造“数字中国”的先锋示范区 ——王晶在第三届数字中国建设峰会“数字福建”分论坛上的演讲',
    '新时代、新基建——CTID平台亮相第三届数字中国建设峰会',
    'CTID“网证+”场景亮相峰会，新大陆助力共建数字身份新生态',
  ];

  final List<String> subTitleItems = <String>[
    '2020-10-15 08:55:55',
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.asset('images/test.png',
                height: 120, width: 100, fit: BoxFit.cover),
            title: Text(
              titleItems[index],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              subTitleItems[index % 1],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.grey);
        },
      ),
    );
  }
}

class PluginButton extends StatelessWidget {
  final String title;
  final IconData iconData;

  PluginButton({Key key, this.title, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                width: 40,
                height: 40,
                color: Colors.lightBlue,
                child: Icon(iconData, size: 32, color: Colors.white),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10)),
              ),
            )
          ],
        ),
        onPressed: null);
  }
}

class TitleContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 45.0, 20.0, 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("多云 20~26°",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    RaisedButton(
                      color: Colors.transparent,
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      child: Row(
                        children: [
                          Icon(Icons.youtube_searched_for, color: Colors.white),
                          SizedBox(width: 5),
                          Text("搜索服务",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {},
                    ),
                  ],
                ))
              ],
            ),
            Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("欧福惠",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(",  欢迎您！",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.texture,
                          size: 70,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
