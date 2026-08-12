import 'package:flutter/material.dart';

class ThemProvider extends ChangeNotifier{
  ThemeMode currentThem=ThemeMode.dark;

  void changeThemMode({required ThemeMode newThem}){
    if(currentThem==newThem) return;
    currentThem=newThem;
    notifyListeners();
  }
}