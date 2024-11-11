part of 'package:splash_screen/splash_screen.dart';

class SplashExtendedCubit<T> extends Cubit<T> {
  bool _isClosed = false;

  SplashExtendedCubit(super.initialState);

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