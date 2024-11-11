
part of 'package:app_environment/app_environment.dart';

class AppEnvironmentImpl extends AppEnvironment
{
  late EnvironmentModel _environmentModel;

  @override
  Future<void> loadEnvironment({required String environmentPath}) async {
    await dotenv.load(fileName: environmentPath);
    _environmentModel = EnvironmentModel(
      appTitle: dotenv.env['appTitle']??'',
      groupKey: dotenv.env['groupKey'],
      groupChannelId: dotenv.env['groupChannelId'],
      groupChannelName: dotenv.env['groupChannelName'],
      environment: dotenv.env['environment']??'',
      baseUrl: dotenv.env['baseUrl']??'',
      iconLogo: dotenv.env['iconLogo']??'',
      iconSvg: dotenv.env['iconSvg']??'',
      applicationAndroidStoreId: dotenv.env['applicationAndroidStoreId'],
      applicationIOSStoreId: dotenv.env['applicationIOSStoreId'],
      aboutUsUrl: dotenv.env['aboutUsUrl'],
      termsConditionUrl: dotenv.env['termsConditionUrl'],
      appNameId: dotenv.env['appNameId'],
      timeZoneLat: dotenv.env['timeZoneLat'],
      timeZoneLong: dotenv.env['timeZoneLong'],
    );

  }

  @override
  EnvironmentModel getEnvironment() {
    return _environmentModel;
  }

  @override
  bool isCurrentEnvironmentEquals(String environment) {
    return _environmentModel.environment == environment;
  }

}