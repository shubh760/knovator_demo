import 'package:flutter/material.dart';
import 'package:knovator_assignment/cosnt/color_const.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: colors.tileColor,
    primaryColor: colors.blackColor);
ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: colors.textColor);
