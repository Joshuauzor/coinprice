import 'package:flutter/material.dart';
import 'package:todo/app/app.dart';

class BodyText extends StatelessWidget {
  const BodyText(
    this.text, {
    this.color = AppColors.primaryColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.visible,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);
  final String? text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    assert(text != null, 'test can not be null');
    return Text(
      text ?? '',
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        overflow: overflow,
      ),
    );
  }
}
