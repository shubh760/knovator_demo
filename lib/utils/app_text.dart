import 'package:flutter/material.dart';
import 'package:knovator_assignment/cosnt/color_const.dart';

class CustomTextStyle {
  static const double defaultSize = 16;
  static const FontWeight defaultFontWeight = FontWeight.normal;
  static const String defaultFontFamily = 'Poppins';
  static Color defaultColor = colors.blackColor;

  static TextStyle textStyle(
      {double? size,
      FontWeight? fontWeight,
      String? fontFamily,
      Color? color}) {
    return TextStyle(
        fontSize: size ?? defaultSize,
        fontWeight: fontWeight ?? defaultFontWeight,
        fontFamily: fontFamily ?? defaultFontFamily,
        color: color ?? defaultColor);
  }
}

class AppText extends StatelessWidget {
  final text;
  final textAlign;
  final textDirection;
  final locale;
  final softWrap;
  final overflow;
  final textScaleFactor;
  final maxLines;
  final semanticsLabel;
  final font;
  final size;
  final fontWeight;
  final color;

  const AppText({
    super.key,
    required this.text,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.font,
    this.size,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      style: CustomTextStyle.textStyle(
          fontFamily: font, size: size, fontWeight: fontWeight, color: color),
    );
  }
}
