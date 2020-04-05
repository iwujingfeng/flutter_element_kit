// 按钮组

import 'package:flutter/material.dart';

class UIButtonBar extends StatelessWidget {
  // 接受的参数
  final String text;
  final Function pressed;
  final double width;
  final double height;
  final Color color; // 统一设置个按钮颜色
  final Color textColor;
  final double radius;
  final double borderWidth;
  final String type;
  final bool isCircle;
  final double elevation;
  final bool isExpand;
  final Color splashColor;
  final int count; // 按钮数量
  final List<String> textList; // 按钮组中按钮的文本
  final List<Color> colorList; // 按钮组中按钮的颜色
  final List<Color> textColorList; // 按钮组中按钮的颜色
  final align; // 对齐方式
  final List<double> padding; // 按钮的内边距
  final List<double> space; // 按钮之间的间距
  UIButtonBar({
    this.type = '', // 默认RaisedButton solid边框按钮 dash虚线边框按钮
    this.isCircle = false, // 是否为圆形按钮
    this.elevation = 0.0,
    this.text = '',
    this.width,
    this.height,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.radius = 3.0,
    this.borderWidth = 1,
    this.pressed,
    this.isExpand = false, // 是否自适应父容器宽度
    this.splashColor,
    this.count = 2,
    this.textList = const [],
    this.colorList = const [],
    this.textColorList = const [],
    this.align = 'center',
    this.padding = const [15.0, 5.0],
    this.space = const [10.0, 10.0],
  });
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      buttonPadding: EdgeInsets.only(left: space[0], right: space[1]),
      alignment: _buildAlignment(),
      children: _buildButtonList(),
    );
  }

  // 构建按钮组列表
  List<Widget> buttonList = [];
  _buildButtonList() {
    for (var i = 0; i < count; i++) {
      buttonList.add(
        Container(
          width: width,
          height: height,
          child: type == 'raised'
              ? _buildRaisedButton(i)
              : type == 'flat' ? _buildFlatButton(i) : _buildOutlineButton(i),
        ),
      );
    }
    return buttonList.toList();
  }

  // 构建对齐方式
  _buildAlignment() {
    print(align);
    switch (align) {
      case 'center':
        return MainAxisAlignment.center;
      case 'start':
        return MainAxisAlignment.start;
      case 'end':
        return MainAxisAlignment.end;
      case 'between':
        return MainAxisAlignment.spaceBetween;
      case 'around':
        return MainAxisAlignment.spaceAround;
      case 'evenly':
        return MainAxisAlignment.spaceEvenly;
    }
  }
  /*
   * 构建各种类型按钮
  */

  // 包含投影的按钮
  Widget _buildRaisedButton(int index) {
    return RaisedButton(
      child: Text('${textList.length == 0 ? text : textList[index]}'),
      color: colorList.length == 0 ? color : colorList[index],
      textColor: textColorList.length == 0 ? textColor : textColorList[index],
      elevation: elevation,
      splashColor: splashColor != null ? splashColor : null,
      padding: _buildPadding(),
      shape: !isCircle
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            )
          : CircleBorder(
              side: BorderSide(
                color: color,
                width: borderWidth,
                style: BorderStyle.solid,
              ),
            ),
      onPressed: () {
        // 点击按钮时 将当前按钮索引传递给外部
        pressed(index);
      },
    );
  }

  // 扁平按钮
  Widget _buildFlatButton(int index) {
    return FlatButton(
      child: Text('${textList.length == 0 ? text : textList[index]}'),
      color: colorList.length == 0 ? color : colorList[index],
      textColor: textColorList.length == 0 ? textColor : textColorList[index],
      splashColor: splashColor != null ? splashColor : null,
      padding: _buildPadding(),
      shape: !isCircle
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            )
          : CircleBorder(
              side: BorderSide(
                color: color,
                width: borderWidth,
                style: BorderStyle.solid,
              ),
            ),
      onPressed: () {
        // 点击按钮时 将当前按钮索引传递给外部
        pressed(index);
      },
    );
  }

  // 带边框的按钮：实线solid 虚线dash
  Widget _buildOutlineButton(int index) {
    return OutlineButton(
      child: Text('${textList.length == 0 ? text : textList[index]}'),
      color: colorList.length == 0 ? color : colorList[index],
      textColor: _buildOutlineButtonTextColor(index),
      highlightedBorderColor: _buildOutlineButtonTextColor(index),
      splashColor: splashColor != null ? splashColor : null,
      padding: _buildPadding(),
      shape: !isCircle
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            )
          : CircleBorder(
              side: BorderSide(
                color: color,
                width: borderWidth,
                style: BorderStyle.solid,
              ),
            ),
      onPressed: () {
        // 点击按钮时 将当前按钮索引传递给外部
        pressed(index);
      },
    );
  }

  // 构建 OutlineButton 文本颜色
  _buildOutlineButtonTextColor(index) {
    if (textColorList.length == 0) {
      if (textColor == Colors.white) {
        return Colors.blue;
      } else {
        return textColor;
      }
    } else {
      return textColorList[index];
    }
  }

  // 构建按钮的padding
  _buildPadding() {
    return EdgeInsets.fromLTRB(padding[0], padding[1], padding[0], padding[1]);
  }
}
