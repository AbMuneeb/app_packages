part of 'package:app_initializer/app_initializer.dart';

abstract class AppInitializerControllerRepo
{
  addAllList(List<SingleChildWidget> providers);
  List<SingleChildWidget> getAllProviders();
}