import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:news_app/App/my_app.dart';
import 'package:news_app/core/services/FCM_Services/fcm_services.dart';
import 'package:news_app/core/services/StorgeLocal/them_local_storge.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
 await FcmServices.setupFlutterNotifications();
 await FcmServices.getTokeDevice();
 await FcmServices.requestPermission();
  await StorgeThemLocalHive.instance.initSharedMain();
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());
  runApp(
    EasyLocalization(
      path: "assets/translations",
      supportedLocales: const [Locale("en"), Locale("ar")],
      saveLocale: true,
      child: const NewsApp(),
    ),
  );
}
