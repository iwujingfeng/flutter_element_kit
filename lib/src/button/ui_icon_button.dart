// 图标按钮
import 'package:flutter/material.dart';

class UIIconButton extends StatelessWidget {
  final text;
  final String type;
  final Function pressed;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Color borderColor;
  final double borderWidth;
  final double radius;
  final List<double> padding; // 按钮的内边距
  final Color highlightColor; // 点击后的按钮颜色
  final Color color;
  final Color textColor;
  final double elevation;
  UIIconButton({
    this.text,
    this.type = '',
    this.pressed,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.borderColor = Colors.blue,
    this.borderWidth = 1.0,
    this.radius = 3.0,
    this.padding = const [5.0, 5.0],
    this.highlightColor,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.elevation = 0.0,
  });
  @override
  Widget build(BuildContext context) {
    // 不含文本的图标按钮
    return text == null
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: IconButton(
                icon: Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                ),
                padding: _buildPadding(),
                onPressed: pressed),
          )
        // 包含文本的图标按钮
        : Container(
            child: type == 'raised'
                ? _buildRaisedIconButton()
                : type == 'flat'
                    ? _buildFlatIconButton()
                    : _buildOutlineIconButton(),
          );
  }

  /*
   * 构建各种类型按钮
  */

  // 包含图标和文本的RaisedButton
  Widget _buildRaisedIconButton() {
    return RaisedButton.icon(
      onPressed: pressed,
      icon: Icon(icon),
      label: Text(text),
      color: color,
      textColor: textColor,
      elevation: elevation,
      highlightColor:
          highlightColor == null ? Colors.transparent : highlightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  // 包含图标和文本的FlatButton
  Widget _buildFlatIconButton() {
    return FlatButton.icon(
      onPressed: pressed,
      icon: Icon(icon),
      label: Text(text),
      color: color,
      textColor: textColor,
      padding: _buildPadding(),
      highlightColor:
          highlightColor == null ? Colors.transparent : highlightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  // 包含图标和文本的OutlineButton
  Widget _buildOutlineIconButton() {
    return OutlineButton.icon(
      onPressed: pressed,
      icon: Icon(icon),
      label: Text(text),
      color: color,
      textColor: textColor == Colors.white ? Colors.blue : textColor,
      padding: _buildPadding(),
      highlightColor:
          highlightColor == null ? Colors.transparent : highlightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  // 构建按钮的padding
  _buildPadding() {
    return EdgeInsets.fromLTRB(padding[0], padding[1], padding[0], padding[1]);
  }
}
