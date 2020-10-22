import 'package:flutter/material.dart';
import 'package:flutter_app/mine/mine_details_page.dart';

class MinePage extends StatelessWidget {
  final String title;

  MinePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: MineContent(),
    );
  }
}

class MineContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        FaceImage(),
        SizedBox(height: 10),
        PersonalName(),
        PersonalInfo(),
        ApplyList(),
      ],
    );
  }
}

class ApplyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ApplyListBody(title: "我的邮箱", iconData: Icons.email_outlined),
        ApplyListBody(title: "我的收藏", iconData: Icons.star_border),
        ApplyListBody(title: "文件中转站", iconData: Icons.backup_outlined),
        ApplyListBody(title: "修改密码", iconData: Icons.lock_open_outlined),
        ApplyListBody(title: "设置", iconData: Icons.settings),
      ],
    );
  }
}

class ApplyListBody extends StatelessWidget {
  final String title;
  final IconData iconData;

  ApplyListBody({Key key, this.title, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(width: 20),
        Icon(
          iconData,
          color: Colors.blue,
          size: 32,
        ),
        SizedBox(width: 10),
        Text(
          "$title",
          style: TextStyle(fontSize: 18),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 20,
            )
          ],
        ))
      ]),
    );
  }
}

class PersonalName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "欧福惠",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),
    );
  }
}

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22.0, 20.0, 30.0, 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Icon(Icons.apartment_outlined, size: 32),
          SizedBox(width: 10),
          Text("新大陆科技集团",
              textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
        ]),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 45),
            Expanded(
                child: Text(
              "福建新大陆通信科技股份有限公司 -可信数字产品事业部 -可信数字产品研发部xxxxxx",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15),
            ))
          ],
        )
      ]),
    );
  }
}

class FaceImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
      icon: ClipOval(
        child: Image.asset('images/test.png',
            height: 120, width: 120, fit: BoxFit.cover),
      ),
      iconSize: 120,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MineDetailsPage(text:"打开个人资料",);
        }));
      },
    ));
  }
}
