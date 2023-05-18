import 'package:flutter/material.dart';

import '../Utilities/theme_helper.dart';

class CustomTextWidget extends StatelessWidget {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize, height, letterSpacing;
  final TextAlign? textAlign;
  final bool underLine;
  final int? maxLines;

  const CustomTextWidget({
    Key? key,
    this.title,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.height,
    this.underLine = false,
    this.maxLines,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      title ?? '',
      textAlign: textAlign,
      style: TextStyle(
        decoration: underLine ? TextDecoration.underline : null,
        height: height,
        letterSpacing: letterSpacing,
        color: color ?? ThemeClass.textColor,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 12,
      ),
      maxLines: maxLines,
    );
  }
}
