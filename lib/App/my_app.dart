import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/core/utils/app_them.dart';
import 'package:provider/provider.dart';

import '../core/logic/providers/localization.dart';
import '../core/logic/providers/them_provider.dart';
import '../core/utils/utils_app_helper.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => LanguageProvider(),
        ),
      ],
      child: CustomMatrialsApp(),
    );
  }
}

class CustomMatrialsApp extends StatelessWidget {
  const CustomMatrialsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Provider.of<LanguageProvider>(context).currentLanguage,
      theme: AppThem.lightThem,
      darkTheme: AppThem.darkThem,
      themeMode: Provider.of<ThemProvider>(context).currentThem,
      home: testWidget(),
    );
  }
}

class testWidget extends StatelessWidget {
  const testWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 24,
          children: [
            Text(
              GetLanguage.locale(context) == const Locale("en")? AppText.english: AppText.arabic,
              style: GetThemData.getTextThemData(context).titleLarge,
            ),
            GestureDetector(
              onTap: () {
                Provider.of<LanguageProvider>(
                  context,
                  listen: false,
                ).changeLanguage(
                  newLang: const Locale("en"),
                  context: context,
                );
                Provider.of<ThemProvider>(
                  context,
                  listen: false,
                ).changeThemMode(
                  newThem: ThemeMode.dark
                );
              },
              child: Text(
                AppText.english,
                style: GetThemData.getTextThemData(context).titleLarge,
              ),
            ),
            GestureDetector(
              onTap: () {
                Provider.of<LanguageProvider>(
                  context,
                  listen: false,
                ).changeLanguage(
                  newLang: const Locale("ar"),
                  context: context,
                );
                Provider.of<ThemProvider>(
                  context,
                  listen: false,
                ).changeThemMode(
                    newThem: ThemeMode.light
                );
              },
              child: Text(
               AppText.arabic,
                style: GetThemData.getTextThemData(context).titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
