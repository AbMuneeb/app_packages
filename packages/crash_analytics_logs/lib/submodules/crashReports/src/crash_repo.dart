part of 'package:crash_analytics_logs/submodules/crashReports/crash_reporting.dart';


abstract class CrashReporting
{

  static final CrashReporting _instance = CrashRepoImpl();
  static CrashReporting get instance => _instance;

  config(FirebaseCrashlytics crashlytics);
  showLogs(dynamic message);
  dispose();
  recordError(
      dynamic exception,
      StackTrace? stack,
      {
        String? reason,
        bool fatal = false,
        bool showLog = false
      }
      );
}