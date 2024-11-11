import 'package:flutter/material.dart';
import 'package:size_configs/size_configs.dart';

abstract class SizeConfig
{
  static final SizeConfig _instance = SizeConfigImpl();
  static SizeConfig get instance => _instance;

  static SizeConfig of(BuildContext context)
  {
    return SizeConfigImpl.of(context);
  }


  bool checkIfSizeConfigWorking();
  void config(BuildContext context);

  double getTotalWidth();
  double getTotalHeight();

  double getWidthWithSafe(double percent);
  double getHeightWithSafe(double percent);

  double getWidthNotSafe(double percent);
  double getHeightNotSafe(double percent);

  double getTextSize(double percent);
}