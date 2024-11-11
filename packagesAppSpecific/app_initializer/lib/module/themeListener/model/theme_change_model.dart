import 'package:flutter/material.dart';

class ThemeModel
{
  ThemeData themeData;
  ThemeData? darkTheme;
  ThemeMode themeMode;
  ThemeModel({required this.themeData,required this.themeMode,this.darkTheme});
}