import 'package:flutter/material.dart';

class GetThemData{
  static TextTheme getTextThemData(BuildContext context) => Theme.of(context).textTheme;
  static ThemeData getColorThemData(BuildContext context) => Theme.of(context);
}

class GetIsDark{
  bool get isDark=>ThemeMode.dark.isDark;
}

class ScreenSize{
 static  double width(BuildContext context)=>MediaQuery.sizeOf(context).width;
 static  double height(BuildContext context)=>MediaQuery.sizeOf(context).height;

}

extension ScreenUtilsContext on BuildContext{
  double get height=>MediaQuery.sizeOf(this).height;
  double get width=>MediaQuery.sizeOf(this).width;
}

