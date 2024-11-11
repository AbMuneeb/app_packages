part of 'package:app_initializer/app_initializer.dart';

class AppInitializerWidget extends StatelessWidget {
  final AppInitialController appInitialController;
  const AppInitializerWidget({required this.appInitialController,super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: appInitialController.getProviders(),
        child: Builder(
          builder: (BuildContext context) {
            return _HomeAppStarter(appInitialController);
          },
        )
    );
  }
}

class _HomeAppStarter extends StatefulWidget {
  final AppInitialController appInitialController;
  const _HomeAppStarter(this.appInitialController, {super.key});

  @override
  State<_HomeAppStarter> createState() => _HomeAppStarterState();
}

class _HomeAppStarterState extends State<_HomeAppStarter> {

  @override
  void initState() {
    if(widget.appInitialController.getCurrentUserLocallySavedLocaleMethod() != null)
      {
        BlocProvider.of<ChangeGlobalLocale>(context,listen: false).setInitialLocale(widget.appInitialController.getCurrentUserLocallySavedLocaleMethod()!);
      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ThemeChangeListener themeChangeListener = BlocProvider.of<ThemeChangeListener>(context,listen: false);
    widget.appInitialController.setThemeListener(themeChangeListener);
    themeChangeListener.initializeThemeModel(themeModel: widget.appInitialController.getCurrentThemeModel(context));

    return BlocConsumer<ChangeGlobalLocale,Locale>(
        listener: (context,data){},
        builder: (context, currentLocale) {
          return  BlocConsumer<ThemeChangeListener, ThemeMode>(
            listener: (context, data){},
            builder: (context, themeMode) {
              return MaterialApp.router(

                scaffoldMessengerKey: GetGlobalContexts.rootScaffoldMessengerKey,
                title: widget.appInitialController.getAppTitle(),
                supportedLocales: widget.appInitialController.getSupportedLocales(),
                theme: themeChangeListener.getThemeModel().themeData, /// created separately because theme can be change able e.g(light theme, dark theme)
                darkTheme: themeChangeListener.getThemeModel().darkTheme,
                themeMode: themeMode,
                locale: currentLocale,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  widget.appInitialController.getAppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                localeResolutionCallback: (deviceLocale,supportedLocals){
                  for(var locale in supportedLocals){
                    if(locale.languageCode==deviceLocale?.languageCode&&locale.countryCode==deviceLocale?.countryCode)
                    {
                      return deviceLocale;
                    }
                  }
                  return supportedLocals.first;
                },
                // initialRoute: '/',
                routerConfig: widget.appInitialController.getScreen(),
                builder: (context, child){

                  final mediaQueryData = MediaQuery.of(context);
                  final scale = mediaQueryData.textScaler.clamp(
                    minScaleFactor: 1.0, // Minimum scale factor allowed.
                    maxScaleFactor: 1.0, // Maximum scale factor allowed.
                  );
                  return MediaQuery(
                    data: mediaQueryData.copyWith(
                      textScaler: scale
                    ),
                      child: child!
                  );

                },
              );
            }
          );
        }
    );
  }
}

