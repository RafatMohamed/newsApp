import 'package:flutter/material.dart';
import 'package:news_app/core/services/StorgeLocal/them_local_storge.dart';
import 'package:news_app/core/utils/utils_app_helper.dart';

class ThemProvider extends ChangeNotifier{
  ThemeMode currentThem= StorgeThemLocalHive.instance.getThemLocal()?ThemeMode.dark:ThemeMode.light;

  void changeThemMode({required ThemeMode newThem}){
    if(currentThem==newThem) return;
    currentThem=newThem;
    StorgeThemLocalHive.instance.saveThemLocal(isDark: newThem==ThemeMode.dark);
    notifyListeners();
  }
}