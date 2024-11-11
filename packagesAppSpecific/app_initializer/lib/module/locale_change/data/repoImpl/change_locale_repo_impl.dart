part of 'package:app_initializer/module/locale_change/locale_change_listener.dart';

class ChangeLanguageRepoImpl extends ChangeLocaleRepo
{
  Locale defaultLocale;
  late Locale currentLocale;

  ChangeLanguageRepoImpl({required this.defaultLocale}){
    currentLocale = defaultLocale;
  }

  @override
  Future<Locale> setInitialLocale(Future<Locale?> Function() currentUserLocale)async {

    Locale? locale = await currentUserLocale();
    if(locale != null)
      {
        currentLocale = locale;
      }
    else
      {
        defaultLocale = currentLocale;
      }
    return currentLocale;
  }

  @override
  Locale changeLocale(Locale locale) {
    currentLocale = locale;
    return currentLocale;
  }


}