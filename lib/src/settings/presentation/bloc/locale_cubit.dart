
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper_methods.dart';
import 'locale_state.dart';


class LocaleCubit extends Cubit<LocalState> {
  LocaleCubit() : super(LocalState()) {
    getInitialData();
  }

  String lang = 'en';

  Future setLanguageData(String value) async {
    lang = value;
    await HelperMethods.setLanguage(value);
    emit(LocalState(language: lang,isLoading: false));
  }

  Future getInitialData() async {
    emit(LocalState(isLoading: true));
      final String language = await HelperMethods.getLanguage();
      lang = language;
      emit(LocalState(language: language, isLoading: false));
   }
}
