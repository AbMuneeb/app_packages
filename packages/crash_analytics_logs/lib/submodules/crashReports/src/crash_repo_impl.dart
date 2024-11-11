
part of 'package:crash_analytics_logs/submodules/crashReports/crash_reporting.dart';

class CrashRepoImpl extends CrashReporting
{
  FirebaseCrashlytics? crashlytics;

  @override
  config(FirebaseCrashlytics crashlytics) {
    this.crashlytics = crashlytics;
  }

  @override
  recordError(exception, StackTrace? stack, {String? reason, bool fatal = false, bool showLog = false}) async {
    unawaited(crashlytics?.recordError(exception, stack,reason: reason,fatal: fatal));
    if(showLog)
    {
      showLogs(exception.toString());
    }
  }

  @override
  showLogs(message) {
    AppLogs.instance.showLogs(message);
  }

  @override
  dispose() {
    crashlytics?.setCrashlyticsCollectionEnabled(false);
  }

}