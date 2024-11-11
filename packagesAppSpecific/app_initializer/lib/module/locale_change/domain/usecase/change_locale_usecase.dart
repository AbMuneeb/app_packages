
part of 'package:app_initializer/module/locale_change/locale_change_listener.dart';

class ChangeLocaleUseCase extends ChangeLocaleUseCaseRepo
{
  late ChangeLocaleRepo _repo;
  late List<Locale> _supportedLocales;

  ChangeLocaleUseCase({
    required ChangeLocaleRepo repo,
    required List<Locale> supportedLocales})
  {
    _repo = repo;
    _supportedLocales = supportedLocales;
  }

  @override
  Future<Locale> setInitialLocale(Future<Locale?> Function() currentUserLocale) {
    return _repo.setInitialLocale(currentUserLocale);
  }

  @override
  bool checkIfLocaleSupportedByApp(Locale locale) {
    for(var availableLocale in _supportedLocales)
    {
      if(availableLocale.languageCode == locale.languageCode)
      {
        return true;
      }
    }
    return false;
  }

  @override
  Locale changeLocale(Locale locale) {
    if(checkIfLocaleSupportedByApp(locale))
      {
        return _repo.changeLocale(locale);
      }

    throw Exception('This language code is not supported by the app. Try to add this locale into the supported local using AppInitialController');
  }

}