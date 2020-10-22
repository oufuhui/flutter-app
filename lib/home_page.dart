import 'package:flutter/material.dart';
import 'package:flutter_app/plugin/plugin_page.dart';
import 'empty_page.dart';
import 'package:flutter_app/mine/mine_page.dart';
import 'package:flutter_app/portal/portal_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> blist = List();

  @override
  void initState() {
    blist
      ..add(EmptyPage(title: "消息"))
      ..add(EmptyPage(title: "通讯录"))
      ..add(PortalPage())
      ..add(PluginPage())
      ..add(MinePage(title: "我"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*
    返回一个脚手架，里面包含两个属性，一个是底部导航栏，另一个就是主体内容
     */
    return Scaffold(
      body: blist[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.lightBlueAccent,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message_sharp,
              ),
              label: '消息'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.contact_phone,
              ),
              label: '通讯录'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard_outlined,
              ),
              label: '门户'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              label: '应用'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: '我'),
        ],
        currentIndex: _currentIndex,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }
}
