import 'package:SocialMediaApp/utils/text_style.dart';
import 'package:flutter/material.dart';

class Follow extends StatelessWidget {
  final Widget widget;
  final String text;
  final String num;
  Follow({this.widget, this.text, this.num});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomTextStyle(
          text: text,
          color: Colors.black54,
          size: 22.0,
        ),
        SizedBox(
          height: 2.0,
        ),
        CustomTextStyle(
          text: num,
          size: 20.0,
          font: FontWeight.w600,
        ),
      ],
    );
  }
}
