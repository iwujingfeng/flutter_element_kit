// 底部导航
import 'package:flutter/material.dart';
import 'package:flutter_element_kit/pages/bottom_navigation_page.dart';

class UIBottomNavigateBar extends StatefulWidget {
  // 接受的参数
  final List<Widget> pageList;
  final List<Map> bottomItemList;
  final Color defaultColor;
  final Color activeColor;
  final double iconSize;
  final double titleSize;
  final Function changeNavigetion;
  // 是否显示中间按钮凸起效果
  final bool showMiddleButton;
  final middleButtonWidth;
  final middleButtonHeight;
  final middleButtonPadding;
  final middleButtonMarginTop;
  final middleButtonWrapDefaultColor;
  final middleButtonWrapActiveColor;
  final middleButtonDefaultColor;
  final middleButtonActiveColor;
  final middleButtonIconDefaultColor;
  final middleButtonIconActiveColor;
  final middleButtonRadius;

  UIBottomNavigateBar(
      {Key key,
      this.pageList = const [],
      this.defaultColor,
      this.activeColor,
      this.bottomItemList = const [],
      this.iconSize,
      this.titleSize,
      this.changeNavigetion,
      this.showMiddleButton,
      this.middleButtonWidth,
      this.middleButtonHeight,
      this.middleButtonPadding,
      this.middleButtonMarginTop,
      this.middleButtonWrapDefaultColor,
      this.middleButtonWrapActiveColor,
      this.middleButtonDefaultColor,
      this.middleButtonActiveColor,
      this.middleButtonIconDefaultColor,
      this.middleButtonIconActiveColor,
      this.middleButtonRadius})
      : super(key: key);
  @override
  _UIBottomNavigateBarState createState() => _UIBottomNavigateBarState();
}

class _UIBottomNavigateBarState extends State<UIBottomNavigateBar> {
  // 当前激活的索引
  int _currentIndex = 0;
  List<Widget> _pageList = [
    BottomNavigationPage(
      title: '首页',
    ),
    BottomNavigationPage(
      title: '发布',
    ),
    BottomNavigationPage(
      title: '我的',
    ),
  ];
  List<Map> _bottomItemList = [
    {
      'defaultIcon': Icons.home,
      'activeIcon': Icons.home,
      'title': '首页',
    },
    {
      'defaultIcon': Icons.publish,
      'activeIcon': Icons.publish,
      'title': '发布',
    },
    {
      'defaultIcon': Icons.people,
      'activeIcon': Icons.people,
      'title': '我的',
    },
  ];
  Color _defaultColor = Colors.grey;
  Color _activeColor = Colors.blue;
  double _iconSize = 25.0;
  double _titleSize = 15.0;
  Function _changeNavigetion = (index) {};
  bool _showMiddleButton;
  double _middleButtonWidth = 60.0;
  double _middleButtonHeight = 60.0;
  double _middleButtonPadding = 8.0;
  double _middleButtonMarginTop = 10.0;
  // 中间按钮容器背景色
  Color _middleButtonWrapDefaultColor = Colors.white;
  Color _middleButtonWrapActiveColor = Colors.white;
  // 中间按钮背景色
  Color _middleButtonDefaultColor = Colors.blue;
  Color _middleButtonActiveColor = Colors.blue;
  // 中间按钮Icon颜色
  Color _middleButtonIconDefaultColor = Colors.white;
  Color _middleButtonIconActiveColor = Colors.white;
  double _middleButtonRadius = 30.0;

  void initState() {
    // 如果用户调用导航没有传参数 数组为空，其他值为null使用默认值
    _pageList = widget.pageList.length == 0 ? _pageList : widget.pageList;
    _bottomItemList = widget.bottomItemList.length == 0
        ? _bottomItemList
        : widget.bottomItemList;
    _defaultColor =
        widget.defaultColor == null ? _defaultColor : widget.defaultColor;
    _activeColor =
        widget.activeColor == null ? _activeColor : widget.activeColor;
    _iconSize = widget.iconSize == null ? _iconSize : widget.iconSize;
    _titleSize = widget.titleSize == null ? _titleSize : widget.titleSize;
    _changeNavigetion = widget.changeNavigetion == null
        ? _changeNavigetion
        : widget.changeNavigetion;
    _showMiddleButton = widget.showMiddleButton == false
        ? _showMiddleButton
        : widget.showMiddleButton;
    _middleButtonWidth = widget.middleButtonWidth == null
        ? _middleButtonWidth
        : widget.middleButtonWidth;
    _middleButtonHeight = widget.middleButtonHeight == null
        ? _middleButtonHeight
        : widget.middleButtonHeight;
    _middleButtonPadding = widget.middleButtonPadding == null
        ? _middleButtonPadding
        : widget.middleButtonPadding;
    _middleButtonMarginTop = widget.middleButtonMarginTop == null
        ? _middleButtonMarginTop
        : widget.middleButtonMarginTop;
    _middleButtonWrapDefaultColor = widget.middleButtonWrapDefaultColor == null
        ? _middleButtonWrapDefaultColor
        : widget.middleButtonWrapDefaultColor;
    _middleButtonWrapActiveColor = widget.middleButtonWrapActiveColor == null
        ? _middleButtonWrapActiveColor
        : widget.middleButtonWrapActiveColor;
    _middleButtonDefaultColor = widget.middleButtonDefaultColor == null
        ? _middleButtonDefaultColor
        : widget.middleButtonDefaultColor;
    _middleButtonActiveColor = widget.middleButtonActiveColor == null
        ? _middleButtonActiveColor
        : widget.middleButtonActiveColor;
    _middleButtonIconDefaultColor = widget.middleButtonIconDefaultColor == null
        ? _middleButtonIconDefaultColor
        : widget.middleButtonIconDefaultColor;
    _middleButtonIconActiveColor = widget.middleButtonIconActiveColor == null
        ? _middleButtonIconActiveColor
        : widget.middleButtonIconActiveColor;
    _middleButtonRadius = widget.middleButtonRadius == null
        ? _middleButtonRadius
        : widget.middleButtonRadius;
    // 调用构建底部导航的构建方法
    _buildBottomItemList(_currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 根据导航索引动态从列表中切换页面
      body: _pageList[_currentIndex],
      // 处理中间按钮凸起效果

      floatingActionButton: _showMiddleButton == true
          ? Container(
              width: _middleButtonWidth,
              height: _middleButtonHeight,
              padding: EdgeInsets.all(_middleButtonPadding),
              margin: EdgeInsets.only(top: _middleButtonMarginTop),
              decoration: BoxDecoration(
                color: _currentIndex == _middleItemIndex()
                    ? _middleButtonWrapActiveColor
                    : _middleButtonWrapDefaultColor,
                borderRadius: BorderRadius.circular(_middleButtonRadius),
              ),
              child: FloatingActionButton(
                child: Icon(
                  _currentIndex == _middleItemIndex()
                      ? _bottomItemList[_middleItemIndex()]['activeIcon']
                      : _bottomItemList[_middleItemIndex()]['defaultIcon'],
                  color: _currentIndex == _middleItemIndex()
                      ? _middleButtonIconActiveColor
                      : _middleButtonIconDefaultColor,
                ),
                backgroundColor: _currentIndex == _middleItemIndex()
                    ? _middleButtonActiveColor
                    : _middleButtonDefaultColor,
                onPressed: () {
                  setState(() {
                    _currentIndex = _middleItemIndex();
                  });
                  // 将当前索引暴露出去 让用户使用
                  _changeNavigetion(_middleItemIndex());
                },
              ),
            )
          : null,
      floatingActionButtonLocation: _showMiddleButton == true
          ? FloatingActionButtonLocation.centerDocked
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          _buildBottomItemList(_currentIndex);
          // 将当前索引暴露出去 让用户使用
          _changeNavigetion(index);
        },
        items: _buildBottomItemList(_currentIndex),
      ),
    );
  }

  // 构建底部item列表(每次切换导航 方法中的_currentIndex不会更新 所以每次切换时调用一下该方法 将_currentIndex传递进来)
  _buildBottomItemList(int currentIndex) {
    List<BottomNavigationBarItem> bottomList = [];
    for (var i = 0; i < _bottomItemList.length; i++) {
      bottomList.add(
        BottomNavigationBarItem(
          icon: Icon(
            _bottomItemList[i]['defaultIcon'],
            color: _defaultColor,
            size: _iconSize,
          ),
          activeIcon: Icon(
            _bottomItemList[i]['activeIcon'],
            color: _activeColor,
            size: _iconSize,
          ),
          title: Text(
            _bottomItemList[i]['title'],
            style: TextStyle(
                fontSize: _titleSize,
                color: currentIndex != i ? _defaultColor : _activeColor),
          ),
        ),
      );
    }
    return bottomList;
  }

  // 获取数组中间的索引
  _middleItemIndex() {
    double tempIndex = (_bottomItemList.length - 1) / 2;
    int index = tempIndex.toInt();
    return index;
  }
}
