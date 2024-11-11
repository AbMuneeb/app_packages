part of 'package:internet_connectivity/internet_connectivity.dart';

class InternetConnectivityBloc extends InternetExtendedCubit<bool>
{
  InternetConnectivityBloc(super.initialState);
  final StreamController<bool> _internetStreamController = StreamController<bool>.broadcast();

  initialize()
  {
    InternetConnectivity.instance.initConnectivity(isInternetAvailableStream: _internetStreamController);
    _listenToInternetChangeEvent();
  }

  _listenToInternetChangeEvent()
  {
    _internetStreamController.stream.listen((event) {emit(event);});
  }

}