
part of 'package:app_environment/app_environment.dart';

abstract class AppEnvironment
{
  static final AppEnvironment _instance = AppEnvironmentImpl();
  static AppEnvironment get instance => _instance;

  Future<void> loadEnvironment({required String environmentPath});
  EnvironmentModel getEnvironment();
  bool isCurrentEnvironmentEquals(String environment);
}
