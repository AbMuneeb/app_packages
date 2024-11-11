part of 'package:crash_analytics_logs/submodules/analyticReports/analytic_report.dart';

abstract class AnalyticReports
{
  static final AnalyticReports _instance = AnalyticReportsImpl();
  static AnalyticReports get instance => _instance;

  config(FirebaseAnalytics analytics);
  recordEvent({required String eventName,Map<String,Object>? parameters});
  showLogs(dynamic message);
}