part of 'package:internet_connectivity/internet_connectivity.dart';

class InternetConnectivityImpl extends InternetConnectivity
{
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  late StreamController<bool> _isInternetAvailableStream;
  InternetConnectionEnum internetConnectionEnum = InternetConnectionEnum.notAvailable;

  @override
  Future<void> initConnectivity({required StreamController<bool> isInternetAvailableStream}) async {
    _isInternetAvailableStream = isInternetAvailableStream;
    List<ConnectivityResult> result = [ConnectivityResult.none];
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      rethrow;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.


    return _updateConnectionStatus(result);

  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    int index = result.indexWhere((element) => element == ConnectivityResult.wifi || element == ConnectivityResult.mobile || element == ConnectivityResult.vpn || element == ConnectivityResult.ethernet || element == ConnectivityResult.other);
    if(index != -1)
      {
        internetConnectionEnum = InternetConnectionEnum.available;
      }
    else {
      internetConnectionEnum = InternetConnectionEnum.notAvailable;
    }
    _isInternetAvailableStream.add(isInternetConnectionAvailable());
    return;

  }

  @override
  bool isInternetConnectionAvailable() {
    return internetConnectionEnum == InternetConnectionEnum.available;
  }

  @override
  dispose() {
    _connectivitySubscription.cancel();
    _isInternetAvailableStream.close();
  }

}