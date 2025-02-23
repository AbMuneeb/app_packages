
import 'package:flutter/material.dart';

class SizeTesting {

  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _blockSizeHorizontal;
  static late double _blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double _safeBlockHorizontal;
  static late double _safeBlockVertical;

  SizeTesting();
  
  SizeTesting.of(BuildContext context)
  {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    _safeBlockHorizontal = (_screenWidth -
        _safeAreaHorizontal) / 100;
    _safeBlockVertical = (_screenHeight -
        _safeAreaVertical) / 100;
  }

  
  static config(BuildContext context)
  {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    _safeBlockHorizontal = (_screenWidth -
        _safeAreaHorizontal) / 100;
    _safeBlockVertical = (_screenHeight -
        _safeAreaVertical) / 100;


  }
  
  static double getTextSize(double percent) {
    return (_safeBlockVertical) * percent;
  }

  
  static double getTotalHeight() {
    return _screenHeight;
  }

  
  static double getTotalWidth() {
    return _screenWidth;
  }

  
  static double getHeightWithSafe(double percent) {
    return _safeBlockVertical * percent;
  }

  
  static double getWidthWithSafe(double percent) {
    return _safeBlockHorizontal * percent;
  }

  
  static double getHeightNotSafe(double percent) {
    return _blockSizeVertical * percent;
  }

  
  static double getWidthNotSafe(double percent) {
    return _blockSizeHorizontal * percent;
  }

  
  static bool checkIfSizeConfigWorking() {
    return _screenHeight >= 0 && _screenWidth>=0;
  }

}