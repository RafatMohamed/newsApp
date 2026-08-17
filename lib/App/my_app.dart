import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_app/core/services/FCM_Services/fcm_services.dart';
import 'package:news_app/core/utils/app_them.dart';
import 'package:provider/provider.dart';
import '../core/logic/providers/localization.dart';
import '../core/logic/providers/them_provider.dart';
import '../feature/home/view/home_view.dart';

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
      child: const CustomMaterialsApp(),
    );
  }
}

class CustomMaterialsApp extends StatefulWidget {
  const CustomMaterialsApp({super.key});

  @override
  State<CustomMaterialsApp> createState() => _CustomMaterialsAppState();
}

class _CustomMaterialsAppState extends State<CustomMaterialsApp> {

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen(FcmServices.showFlutterNotification);
    FirebaseMessaging.onMessage.listen((event) {
     return print(event.messageId);
    },);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppThem.lightThem,
      darkTheme: AppThem.darkThem,
      themeMode: Provider.of<ThemProvider>(context).currentThem,
      home: const HomeView(),
    );
  }
}

