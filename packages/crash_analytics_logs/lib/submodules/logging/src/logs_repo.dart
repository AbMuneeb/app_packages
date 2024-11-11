part of 'package:crash_analytics_logs/submodules/logging/logs.dart';

abstract class AppLogs
{
  static final AppLogs _instance = AppsRepoImpl();
  static AppLogs get instance => _instance;

  showLogs(dynamic message);
  showPrintLog(dynamic message);

}