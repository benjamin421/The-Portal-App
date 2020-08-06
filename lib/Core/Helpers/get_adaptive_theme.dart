import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final ThemeData _androidTheme = ThemeData(
    primarySwatch: Colors.yellow,
    primaryColor: Color(0xffeaff68),
    buttonColor: Color(0xffeaff68),
    accentColor: Color(0xffeaff68),
    textTheme: TextTheme(body1: TextStyle(color: Color(0xff5F7081))));

final ThemeData _iOSTheme = ThemeData(
    primarySwatch: Colors.yellow,
    primaryColor: Color(0xffeaff68),
    buttonColor: Color(0xffeaff68),
    accentColor: Color(0xffeaff68),
    textTheme: TextTheme(body1: TextStyle(color: Color(0xff5F7081))));

ThemeData getAdaptiveTheme(context) {
  return Theme.of(context).platform == TargetPlatform.android
      ? _androidTheme
      : _iOSTheme;
}
