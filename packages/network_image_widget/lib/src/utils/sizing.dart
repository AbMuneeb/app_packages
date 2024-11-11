import 'package:flutter/material.dart';

class NetWorkImageSizeConfigImpl{

  late MediaQueryData _mediaQueryData;
  late double _screenWidth;
  late double _screenHeight;
  late double _blockSizeHorizontal;
  late double _blockSizeVertical;

  late double _safeAreaHorizontal;
  late double _safeAreaVertical;
  late double _safeBlockHorizontal;
  late double _safeBlockVertical;

  NetWorkImageSizeConfigImpl();

  NetWorkImageSizeConfigImpl.of(BuildContext context)
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

  config(BuildContext context)
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


  double getTextSize(double percent) {
    return (((_safeBlockHorizontal + _safeBlockVertical)/2) * percent);
  }

  double getTotalHeight() {
    return _screenHeight;
  }

  double getTotalWidth() {
    return _screenWidth;
  }

  double getHeightWithSafe(double percent) {
    return _safeBlockVertical * percent;
  }

  double getWidthWithSafe(double percent) {
    return _safeBlockHorizontal * percent;
  }

  double getHeightNotSafe(double percent) {
    return _blockSizeVertical * percent;
  }

  double getWidthNotSafe(double percent) {
    return _blockSizeHorizontal * percent;
  }

  bool checkIfSizeConfigWorking() {
    return _screenHeight >= 0 && _screenWidth>=0;
  }

}