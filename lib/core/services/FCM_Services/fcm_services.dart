import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_app/core/utils/app_colors.dart';

import '../../../firebase_options.dart';

class FcmServices {
static  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
static late AndroidNotificationChannel channel;
static bool isFlutterLocalNotificationsInitialized = false;

static Future<void> getTokeDevice()async{
 String? tokenDevice =await FirebaseMessaging.instance.getToken();
 log("tojen devices => $tokenDevice");
 print("tojen devices => $tokenDevice");
}

static  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true,
      enableLights: true,
      ledColor: Colors.green,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

static void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        id: notification.hashCode,
        title: notification.title,
        body: notification.body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            color: Color(0xff171717),
            icon: 'launch_background',
          ),
        ),
      );
    }
  }

static Future<void> requestPermission() async {
  final settings =
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  log(
    'Permission: ${settings.authorizationStatus}',
  );
}

}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FcmServices.setupFlutterNotifications();
  FcmServices.showFlutterNotification(message);
  print('Handling a background message ${message.messageId}');
}

