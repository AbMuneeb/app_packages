part of 'package:crash_analytics_logs/crash_analytics_logs.dart';

abstract class CrashAnalyticsLogs
{
  static final CrashAnalyticsLogs _instance = CrashAnalyticsLogsImpl();
  static CrashAnalyticsLogs get instance => _instance;

  initialize({required FirebaseAnalytics analytics,required FirebaseCrashlytics crashlytics});
  AnalyticReports getAnalyticInstance();
  CrashReporting getCrashInstance();
  AppLogs getLogsInstance();
}