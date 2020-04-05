// 基本按钮
import 'package:flutter/material.dart';

class UIBaseButton extends StatelessWidget {
  // 接受的参数
  final String text;
  final Function pressed;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final double radius;
  final double borderWidth;
  final String type;
  final bool isCircle;
  final double elevation;
  final bool isExpand;
  final Color splashColor;
  final List<double> padding; // 按钮的内边距
  UIBaseButton({
    this.type = '',
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
    this.padding = const [5.0, 5.0],
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpand == true ? double.infinity : width,
      height: height,
      child: type == 'raised'
          ? _buildRaisedButton()
          : type == 'flat' ? _buildFlatButton() : _buildOutlineButton(),
    );
  }

  /*
   * 构建各种类型按钮
  */

  // 包含投影的按钮
  Widget _buildRaisedButton() {
    return RaisedButton(
      child: Text(text),
      color: color,
      textColor: textColor,
      elevation: elevation,
      padding: _buildPadding(),
      splashColor: splashColor != null ? splashColor : null,
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
      onPressed: pressed,
    );
  }

  // 扁平按钮
  Widget _buildFlatButton() {
    return FlatButton(
      child: Text(text),
      color: color,
      textColor: textColor,
      padding: _buildPadding(),
      splashColor: splashColor != null ? splashColor : null,
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
      onPressed: pressed,
    );
  }

  // 带边框的按钮：实线solid 虚线dash
  Widget _buildOutlineButton() {
    return OutlineButton(
      onPressed: pressed,
      color: color,
      textColor: textColor == Colors.white ? Colors.blue : textColor,
      splashColor: splashColor != null ? splashColor : null,
      padding: _buildPadding(),
      child: Text(text),
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
    );
  }

  // 构建按钮的padding
  _buildPadding() {
    return EdgeInsets.fromLTRB(padding[0], padding[1], padding[0], padding[1]);
  }
}
