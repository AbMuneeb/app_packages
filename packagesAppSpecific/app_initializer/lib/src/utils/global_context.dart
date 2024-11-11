part of 'package:app_initializer/app_initializer.dart';

class GetGlobalContexts {

  static final GlobalKey<ScaffoldMessengerState> _rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  static GlobalKey<ScaffoldMessengerState> get rootScaffoldMessengerKey => _rootScaffoldMessengerKey;
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static BuildContext getNavigatorContext()
  {
    try{
      return _navigatorKey.currentState!.context;
    }catch(e)
    {
      throw Exception('Global context is null');
    }
  }



}
