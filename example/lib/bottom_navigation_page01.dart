// 引入底部导航时初始显示的页面

import 'package:flutter/material.dart';

class BottomNavigationPage01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('页面01'),
        ),
        body: Center(
          child: Text('页面01'),
        ));
  }
}
