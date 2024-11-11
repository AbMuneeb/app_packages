
part of 'package:crash_analytics_logs/crash_analytics_logs.dart';

class CrashAnalyticsLogsImpl extends CrashAnalyticsLogs
{
  @override
  initialize({required FirebaseAnalytics analytics, required FirebaseCrashlytics crashlytics}) {
    AnalyticReports.instance.config(analytics);
    CrashReporting.instance.config(crashlytics);
  }

  @override
  AnalyticReports getAnalyticInstance() {
    return AnalyticReports.instance;
  }

  @override
  CrashReporting getCrashInstance() {
    return CrashReporting.instance;
  }

  @override
  AppLogs getLogsInstance() {
    return AppLogs.instance;
  }
}