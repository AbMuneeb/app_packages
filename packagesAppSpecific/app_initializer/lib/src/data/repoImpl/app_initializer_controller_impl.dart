
part of 'package:app_initializer/app_initializer.dart';


class AppInitializerControllerImpl extends AppInitializerControllerRepo
{
  late List<SingleChildWidget> _allProvider;

  AppInitializerControllerImpl({required Locale defaultLocale,required List<Locale> supportedLocale})
  {
    _allProvider = [
      BlocProvider<ChangeGlobalLocale>(create: (_) => ChangeGlobalLocale(
          defaultLocale,
          defaultLocale: defaultLocale,
          supportedLocales: supportedLocale)
      ),
      BlocProvider<ThemeChangeListener>(create: (_) => ThemeChangeListener(ThemeMode.system))
    ];
  }

  @override
  addAllList(List<SingleChildWidget> providers) {
    _allProvider.addAll(providers);
  }

  @override
  List<SingleChildWidget> getAllProviders() {
    return _allProvider;
  }

}