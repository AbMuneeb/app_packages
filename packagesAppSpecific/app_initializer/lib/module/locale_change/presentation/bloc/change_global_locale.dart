part of 'package:app_initializer/module/locale_change/locale_change_listener.dart';

class ChangeGlobalLocale extends Cubit<Locale>
{
  late ChangeLocaleUseCase useCase;
  StreamController<Locale>? _languageController;

  ChangeGlobalLocale(super.initialState,{required Locale defaultLocale,required List<Locale> supportedLocales})
  {
    useCase = ChangeLocaleUseCase(repo: ChangeLanguageRepoImpl(defaultLocale: defaultLocale), supportedLocales: supportedLocales);
  }

  setInitialLocale(Future<Locale?> Function() currentUserLocale) async {
    emit(await useCase.setInitialLocale(currentUserLocale));
  }

  setListener(StreamController<Locale>? languageController)
  {
    _languageController = languageController;
  }

  changeLocale(Locale locale) {
    try{
      emit(useCase.changeLocale(locale));

      if(_languageController != null && !(_languageController!.isClosed))
      {
        _languageController?.add(locale);
      }
    }catch(e){
      rethrow;
    }
  }

  Locale getCurrentLocale()
  {
    return state;
  }

}