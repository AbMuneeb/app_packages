
part of 'package:app_initializer/app_initializer.dart';

class AppInitialControllerUseCase extends AppInitialController
{
  late Future<void> Function(BuildContext context) initialMethodCallsAfterMaterialApp;
  late List<Locale> supportedLocales;
  late String appTitle;
  late AppInitializerControllerRepo _instance;
  late GoRouter screens;
  late ThemeModel Function(BuildContext context) getThemeModel;
  late dynamic appLocalizationDelegate;
  Future<Locale?> Function()? currentUserLocallySavedLocale;
  ThemeChangeListener? _themeChangeListener;

  @override
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

  }) async {
    this.initialMethodCallsAfterMaterialApp = initialMethodCallsAfterMaterialApp;
    this.appLocalizationDelegate = appLocalizationDelegate;
    this.supportedLocales = supportedLocales;
    this.appTitle = appTitle;
    this.screens = screens;
    this.currentUserLocallySavedLocale = currentUserLocallySavedLocale;
    this.getThemeModel = getThemeModel;

    _instance = AppInitializerControllerImpl(defaultLocale: defaultLocale,supportedLocale: supportedLocales);
    _instance.addAllList(providers);
    return;
  }

  @override
  List<SingleChildWidget> getProviders()
  {
    return _instance.getAllProviders();
  }

  @override
  Future<void> callInitialMethodAfterMaterialApp(BuildContext context)async {
    await initialMethodCallsAfterMaterialApp(context);
  }

  @override
  List<Locale> getSupportedLocales() {
    return supportedLocales;
  }

  @override
  String getAppTitle() {
    return appTitle;
  }

  @override
  GoRouter getScreen() {
    return screens;
  }

  @override
  ThemeModel getCurrentThemeModel(BuildContext context) {
    return getThemeModel(context);
  }

  @override
  Future<Locale?> Function()? getCurrentUserLocallySavedLocaleMethod() {
    return currentUserLocallySavedLocale;
  }

  @override
  getAppLocalizationDelegate() {
    return appLocalizationDelegate;
  }

  @override
  changeTheme(ThemeMode themeMode) {
    _themeChangeListener?.updateTheme(themeMode);
  }

  @override
  setThemeListener(ThemeChangeListener themeChangeListener) {
    _themeChangeListener = themeChangeListener;
  }

}