import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_them.dart';
import 'package:provider/provider.dart';

import '../core/logic/providers/them_provider.dart';
import '../core/utils/utils_app_helper.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ThemProvider(),
      child: CustomMatrialsApp(),
    );
  }
}

class CustomMatrialsApp extends StatelessWidget {
  const CustomMatrialsApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThem.lightThem,
      darkTheme: AppThem.darkThem,
      themeMode:Provider.of<ThemProvider>(context).currentThem,
      home: testWidget(),
    );
  }
}

class testWidget extends StatelessWidget {
  const testWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark=GetIsDark.isDark;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            GestureDetector(
              onTap: () {
                Provider.of<ThemProvider>(context,listen: false).changeThemMode(newThem: isDark?ThemeMode.dark:ThemeMode.light);
              },
              child: Text(
                isDark ?"Test Them Dark":"Test Them Light",
                style: GetThemData.getTextThemData(context).titleLarge,
              ),
            ),
            GestureDetector(
              onTap: () {
                Provider.of<ThemProvider>(context,listen: false).changeThemMode(newThem: isDark?ThemeMode.light:ThemeMode.dark);
              },
              child: Text(
                isDark ?"Test Them Dark":"Test Them Light",
                style: GetThemData.getTextThemData(context).titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
