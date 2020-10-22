import 'package:flutter/material.dart';
import 'package:flutter_app/mine/mine_page.dart';

class MineDetailsPage extends StatelessWidget {
  final String text;

  MineDetailsPage({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人资料"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
}
