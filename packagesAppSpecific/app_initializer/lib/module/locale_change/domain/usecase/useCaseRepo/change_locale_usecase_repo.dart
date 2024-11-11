part of 'package:app_initializer/module/locale_change/locale_change_listener.dart';

abstract class ChangeLocaleUseCaseRepo
{
  Future<Locale> setInitialLocale(Future<Locale> Function() currentUserLocale);
  Locale changeLocale(Locale locale);
  bool checkIfLocaleSupportedByApp(Locale locale);
}