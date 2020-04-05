import 'package:example/bottom_navigation_page01.dart';
import 'package:example/bottom_navigation_page02.dart';
import 'package:example/bottom_navigation_page03.dart';
import 'package:flutter/material.dart';
import 'package:flutter_element_kit/flutter_element_kit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Map> bottomItemList = [
    {
      'defaultIcon': Icons.home,
      'activeIcon': Icons.home,
      'title': '首页',
    },
    {
      'defaultIcon': Icons.message,
      'activeIcon': Icons.mode_edit,
      'title': '聊天',
    },
    {
      'defaultIcon': Icons.people,
      'activeIcon': Icons.people,
      'title': '我的',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: UIBottomNavigateBar(
        pageList: <Widget>[
          BottomNavigationPage01(),
          BottomNavigationPage02(),
          BottomNavigationPage03(),
        ],
        bottomItemList: bottomItemList,
        showMiddleButton: true,
        changeNavigetion: (index) {
          print(index);
        },
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Container(
//           // width: 300,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               UIBaseButton(
//                 text: '清明节纪念先人',
//                 // width: 150,
//                 // height: 40,
//                 padding: [20,10],
//                 // isCircle: true,
//                 textColor: Colors.white,
//                 color: Colors.green,
//                 // type: 'flat',
//                 elevation: 0.0,
//                 // splashColor: Colors.yellow,
//                 isExpand: false,
//                 pressed: () {
//                   print('点击了按钮');
//                 },
//               ),
//               UIButtonBar(
//                 text: '按钮组',
//                 // padding: [30,10],
//                 // space: [20,20],
//                 align: 'center',
//                 // width: 80,
//                 // type: 'flat',
//                 // isExpand: true,
//                 count: 3,
//                 // radius: 6,
//                 textList: ['按钮组1', '按钮组2', '按钮组3'],
//                 // colorList: [Colors.blue, Colors.orange, Colors.green],
//                 // textColorList: [Colors.blue, Colors.orange, Colors.green],
//                 pressed: (index) {
//                   print('按钮组$index');
//                 },
//               ),
//               UIIconButton(
//                 text: '按钮',
//                 icon: Icons.phone,
//                 iconSize: 30.0,
//                 iconColor: Colors.blue,
//                 borderWidth: 2,
//                 type: 'flat',
//                 elevation: 5.0,
//                 radius: 5.0,
//                 borderColor: Colors.yellow,
//                 highlightColor: Colors.yellow,
//                 padding: [20.0,3.0],
//                 pressed: () {
//                   print('图标按钮');
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
