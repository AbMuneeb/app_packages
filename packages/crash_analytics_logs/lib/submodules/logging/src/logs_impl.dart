part of 'package:crash_analytics_logs/submodules/logging/logs.dart';

class AppsRepoImpl extends AppLogs
{
  @override
  showLogs(message) {
    if(!kReleaseMode)
      {
        log(message.toString());
      }
  }

  @override
  showPrintLog(message) {
    if (kDebugMode) {
      print(message.toString());
    }
  }
}