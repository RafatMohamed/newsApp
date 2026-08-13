import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GetThemData {
  static TextTheme getTextThemData(BuildContext context) =>
      Theme.of(context).textTheme;
  static ThemeData getColorThemData(BuildContext context) => Theme.of(context);
}

class GetIsDark {
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}

class GetLanguage {
  static Locale locale(BuildContext context) => context.locale;
}

class GetIsEnglish {
  static bool isEnglish(BuildContext context) =>
      GetLanguage.locale(context) == const Locale("en");
}

class ScreenSize {
  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;
  static double height(BuildContext context) =>
      MediaQuery.sizeOf(context).height;
}

extension ScreenUtilsContext on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}
