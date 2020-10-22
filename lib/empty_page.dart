import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String title;

  EmptyPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
    );
  }
}
