part of 'package:internet_connectivity/internet_connectivity.dart';

abstract class InternetConnectivity
{

  static final InternetConnectivity _instance = InternetConnectivityImpl();
  static InternetConnectivity get instance => _instance;

  Future<void> initConnectivity({required StreamController<bool> isInternetAvailableStream});
  bool isInternetConnectionAvailable();
  dispose();
}