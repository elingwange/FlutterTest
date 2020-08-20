import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  String title;
  double fontSize;
  double width;
  double height;
  FontWeight fontweight;
  Color titleColor; //   字体颜色
  Color backgroundColor; //  背景颜色
  Color borderColor; //   边框颜色
  Function onTap; // 点击
  double borderRadius; // 圆角
  double borderWidth; // 线宽
  

  CustomButton(
      {Key key,
      this.width,
      this.height,
      this.title,
      this.fontSize,
      this.titleColor,
      this.backgroundColor,
      this.borderColor = Colors.transparent,
      this.onTap,
      this.fontweight,
      this.borderRadius = 0,
      this.borderWidth = 0})
      : super(key: key);

  _CustomButtonState createState() => _CustomButtonState(
      title: this.title,
      height: this.height,
      width: this.width,
      fontSize: this.fontSize,
      titleColor: this.titleColor,
      borderColor: this.borderColor,
      backgroundColor: this.backgroundColor,
      borderRadius: this.borderRadius,
      borderWidth: this.borderWidth,
      onTap: this.onTap,
      fontweight: this.fontweight);
}

class _CustomButtonState extends State<CustomButton> {
  String title;
  double width;
  double height;
  double fontSize;
  FontWeight fontweight;
  Color titleColor; //   字体颜色
  Color backgroundColor; //  背景颜色
    Color borderColor; //   边框颜色
  double borderRadius; // 圆角
  double borderWidth; // 线宽
  Function onTap; // 点击
  FlatButton btn;

  _CustomButtonState(
      {this.title,
      this.titleColor,
      this.width,
      this.height,
      this.fontSize,
      this.onTap,
      this.backgroundColor,
      this.borderColor,
      this.borderRadius,
      this.borderWidth,
      this.fontweight});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      radius: 0.0,
      highlightColor: Colors.transparent,
      onTap: this.onTap,
      child: Container(
        width: this.width,
        height: this.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(this.borderRadius)),
            border: Border.all(width: ScreenUtil().setWidth(this.borderWidth),color: widget.borderColor)),
        child: Text(
          this.title,
          style: TextStyle(
              color: widget.titleColor,
              fontSize: this.fontSize,
              fontWeight: this.fontweight),
        ),
      ),
    );
  }
}
