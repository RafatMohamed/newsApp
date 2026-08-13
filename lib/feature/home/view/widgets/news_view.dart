import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/core/utils/utils_app_helper.dart';
import 'package:provider/provider.dart';

import '../../../../core/logic/providers/localization.dart';
import '../../../../core/logic/providers/them_provider.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        spacing: 24,
        children: [
          Text(
            GetLanguage.locale(context) == const Locale("en")
                ? AppText.english
                : AppText.arabic,
            style: GetThemData.getTextThemData(context).titleLarge,
          ),
          GestureDetector(
            onTap: () {
              Provider.of<LanguageProvider>(
                context,
                listen: false,
              ).changeLanguage(newLang: const Locale("en"), context: context);
              Provider.of<ThemProvider>(
                context,
                listen: false,
              ).changeThemMode(newThem: ThemeMode.dark);
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
              ).changeLanguage(newLang: const Locale("ar"), context: context);
              Provider.of<ThemProvider>(
                context,
                listen: false,
              ).changeThemMode(newThem: ThemeMode.light);
            },
            child: Text(
              AppText.arabic,
              style: GetThemData.getTextThemData(context).titleLarge,
            ),
          ),
        ],
      ),
    )
    ;
  }
}
