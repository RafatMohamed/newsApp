import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  Locale currentLanguage=const Locale("en");

  void changeLanguage({required Locale newLang,required BuildContext context}){
    if(currentLanguage==newLang) return;
    currentLanguage=newLang;
    context.setLocale(newLang);
    notifyListeners();
  }
}