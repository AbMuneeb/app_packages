
part of 'package:splash_screen/splash_screen.dart';

class SplashScreenBloc extends SplashExtendedCubit<bool>
{
  Future<void> Function(BuildContext context) callInitialMethodAfterMaterialApp;
  SplashScreenBloc(super.initialState,{required this.callInitialMethodAfterMaterialApp});

  callAppInitializers(BuildContext context)async
  {
    await callInitialMethodAfterMaterialApp(context);
    emit(true);
  }
}

