import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/App/my_app.dart';
import 'package:news_app/core/services/StorgeLocal/them_local_storge.dart';
import 'package:timeago/timeago.dart' as timeago;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await StorgeThemLocalHive.instance.initSharedMain();
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());
  runApp(
    EasyLocalization(
      path: "assets/translations",
      supportedLocales: const [Locale("en"), Locale("ar")],
      saveLocale: true,
      fallbackLocale: const Locale("en"),
      startLocale: const Locale("en"),
      child: const NewsApp(),
    ),
  );
}
