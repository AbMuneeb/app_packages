import 'package:app_initializer/module/themeListener/model/theme_change_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeChangeListener extends Cubit<ThemeMode>
{
  late ThemeModel _themeModel;
  ThemeChangeListener(super.initialState);

  initializeThemeModel({required ThemeModel themeModel})
  {
    _themeModel = themeModel;
  }

  updateTheme(ThemeMode themeMode)
  {
    _themeModel.themeMode = themeMode;

    emit(themeMode);
  }

  ThemeModel getThemeModel()
  {
    return _themeModel;
  }
}