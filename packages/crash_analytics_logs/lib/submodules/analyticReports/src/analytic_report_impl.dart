
part of 'package:crash_analytics_logs/submodules/analyticReports/analytic_report.dart';

class AnalyticReportsImpl extends AnalyticReports
{
  FirebaseAnalytics? analytics;

  @override
  config(FirebaseAnalytics analytics) {
    this.analytics = analytics;
  }

  @override
  recordEvent({required String eventName, Map<String, Object>? parameters}) {
    analytics?.logEvent(name: eventName,parameters: parameters);
  }

  @override
  showLogs(message) {
    AppLogs.instance.showLogs(message);
  }

}