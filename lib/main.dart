import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/App/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await StorgeLocalHive.instance.initSharedMain();
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
