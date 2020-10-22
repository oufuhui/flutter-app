import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/portal_item.dart';

class PluginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PluginContent(),
    );
  }
}

class PluginContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "应用",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.store_rounded,
                          size: 30,
                        ),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {})
                  ],
                ))
              ],
            ),
            SizedBox(height: 20),
            Text(
              "新大陆科技集团",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 40),
            Text(
              "企业办公",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            BusinessPlugin(),
            SizedBox(height: 20),
            Text(
              "员工生活",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            EmployeePlugin(),
          ],
        ),
      ),
    );
  }
}

class EmployeePlugin extends StatelessWidget {
  final List<PortalItem> pluginItems = [
    PortalItem(title: "悠斋书吧", icon: Icons.auto_stories),
    PortalItem(title: "健康上报", icon: Icons.admin_panel_settings_outlined),
    PortalItem(title: "健身预约", icon: Icons.assistant),
    PortalItem(title: "名企微贷", icon: Icons.widgets),
    PortalItem(title: "修改密码", icon: Icons.lock_open),
    PortalItem(title: "益农商城", icon: Icons.account_balance_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: GridView.builder(
        itemCount: pluginItems.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, //横轴三个子widget
          childAspectRatio: 1.0, //宽高比为1时，子widget
          crossAxisSpacing: 5,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final item = pluginItems[index];
          return PluginButton(title: item.title, iconData: item.icon);
        },
      ),
    );
  }
}

class BusinessPlugin extends StatelessWidget {
  final List<PortalItem> pluginItems = [
    PortalItem(title: "25周年庆", icon: Icons.stars_rounded),
    PortalItem(title: "新闻中心", icon: Icons.art_track_sharp),
    PortalItem(title: "员工风采", icon: Icons.people_alt),
    PortalItem(title: "员工社区", icon: Icons.water_damage_rounded),
    PortalItem(title: "学习平台", icon: Icons.auto_stories),
    PortalItem(title: "移动考勤", icon: Icons.access_time_outlined),
    PortalItem(title: "商旅服务", icon: Icons.work_outlined),
    PortalItem(title: "餐厅服务", icon: Icons.house_siding),
    PortalItem(title: "班车服务", icon: Icons.airport_shuttle),
    PortalItem(title: "视频会议", icon: Icons.airplay_outlined),
    PortalItem(title: "流程中心", icon: Icons.assignment_turned_in_outlined),
    PortalItem(title: "访客系统", icon: Icons.account_circle_rounded),
    PortalItem(title: "公司制度", icon: Icons.assignment),
    PortalItem(title: "统一消息推送\n中心", icon: Icons.add_alert_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 440,
      child: GridView.builder(
        itemCount: pluginItems.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, //横轴三个子widget
          childAspectRatio: 1.0, //宽高比为1时，子widget
          crossAxisSpacing: 5,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final item = pluginItems[index];
          return PluginButton(title: item.title, iconData: item.icon);
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
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, size: 50, color: Colors.blue),
          Text(title,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
