part of 'package:internet_connectivity/internet_connectivity.dart';

class InternetExtendedCubit<T> extends Cubit<T> {
  bool _isClosed = false;

  InternetExtendedCubit(super.initialState);

  @override
  bool get isClosed => _isClosed;

  @override
  Future<void> close() {
    _isClosed = true;
    return super.close();
  }

  @override
  void emit(T state) {
    if(_isClosed==false) {
      super.emit(state);
    }
  }
}