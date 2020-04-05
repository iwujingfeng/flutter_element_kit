// 引入底部导航时初始显示的页面（默认示例页面）

import 'package:flutter/material.dart';

class BottomNavigationPage extends StatelessWidget {
  final title;
  BottomNavigationPage({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(title),
        ));
  }
}
