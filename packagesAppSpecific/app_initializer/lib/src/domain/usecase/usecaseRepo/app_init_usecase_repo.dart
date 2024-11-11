part of 'package:app_initializer/app_initializer.dart';

abstract class AppInitialController
{
  static final AppInitialController _instance = AppInitialControllerUseCase();
  static AppInitialController get instance => _instance;

  Future<void> initialize({
    required dynamic appLocalizationDelegate,
    required String appTitle,
    required List<SingleChildWidget> providers,
    required Future<void> Function(BuildContext context) initialMethodCallsAfterMaterialApp,
    required List<Locale> supportedLocales,
    required Locale defaultLocale,
    required GoRouter screens,
    required ThemeModel Function(BuildContext context) getThemeModel,
    Future<Locale?> Function()? currentUserLocallySavedLocale
  });

  List<SingleChildWidget> getProviders();
  Future<void> callInitialMethodAfterMaterialApp(BuildContext context);
  List<Locale> getSupportedLocales();
  GoRouter getScreen();
  String getAppTitle();
  ThemeModel getCurrentThemeModel(BuildContext context);
  setThemeListener(ThemeChangeListener themeChangeListener);
  changeTheme(ThemeMode themeMode);
  Future<Locale?> Function()? getCurrentUserLocallySavedLocaleMethod();
  dynamic getAppLocalizationDelegate();
}