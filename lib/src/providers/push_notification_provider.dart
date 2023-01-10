import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:seguro_motors_final/src/providers/auth_provider.dart';
import 'package:timezone/timezone.dart' as tz;

class PushNotificationProvider{

  late AndroidNotificationChannel channel;
  bool isFlutterLocalNotificationsInitialized = false;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin= FlutterLocalNotificationsPlugin();

  void initNotifications() async{
    const AndroidInitializationSettings _androidInit=
    AndroidInitializationSettings('@mipmap/ic_notif');

    InitializationSettings _initSetting=InitializationSettings(
      android: _androidInit
    );

    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin.initialize(_initSetting);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  void scheduleNotification(int hour,int minute) async{
    final String currentTimeZone=await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    var bigImage=const BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('@mipmap/ic_notif'),
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_notif'),
      contentTitle: 'Es hora de pagar',
      summaryText: 'Paga tus seguros',
      htmlFormatContent: true,
      htmlFormatContentTitle: true
    );

    AndroidNotificationDetails androidNotificationDetails=
        AndroidNotificationDetails(
            'channelId',
            'channelName',
          importance: Importance.max,
          priority: Priority.high,
          styleInformation: bigImage
        );
    NotificationDetails notificationDetails=NotificationDetails(
      android: androidNotificationDetails
    );

    tz.TZDateTime utcTime=tz.TZDateTime.now(tz.local);

    tz.TZDateTime scheduleDate=tz.TZDateTime(
      tz.local,
      utcTime.year,
      utcTime.month,
      utcTime.day,
      hour,
      minute+1
    );

    if(scheduleDate.isBefore(utcTime)){
      scheduleDate=scheduleDate.add(const Duration(days: 1));
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'TITULO',
        'BODY',
        scheduleDate,
        notificationDetails,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true
    );
    /*await flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        'Aviso',
        'Manana es el plazo para pagar tu seguro.',
        RepeatInterval.everyMinute,
        notificationDetails
    );*/
  }

  cancelNotification() async{
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  void onMessageListener(){
    // segundo plano
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print('nueva notifiacion: $message');
      }
    });
    // recibir las notificaciones en primer plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null ) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: 'launch_background',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      /*Navigator.pushNamed(context, '/message',
          arguments: MessageArguments(message, true));*/
    });
  }

  Future<void> saveToken(BuildContext context) async{
    String? token=await FirebaseMessaging.instance.getToken();
    print('token firebase: $token');
    final AuthProvider provider = await Provider.of<AuthProvider>(context,listen: false);
    await provider.updateNotificationToken(token);
    //UserProvider user_provider=new UserProvider();
    //user_provider.init(context,sessionUser: user);
    //user_provider.updateNotificationToken(user.id, token);
  }

  Future<void> sendMessage(String to,Map<String, dynamic> data,
      String title, String body) async{
    Uri uri=Uri.http('fmc.googleapis.com','/fcm/send');
    await http.post(uri,
        headers: <String,String>{
      'Content-type': 'application/json',
      'Authorization':'key=AAAAJ3hq5Ng:APA91bGapc9rgrGADichdZfJSh58rkDnIqIbB_qfvPOiNoHZzfXgYLgatrxLXCg9VPgkfxUyhGLhi_xnzpHZvVaFvZst_9hx1LsBOpSpRfxTOBDTTQWKvX6hckFGV5HJ8dwOwiNARr0P'
    },
      body: jsonEncode({[
        
      ]})
    );
  }
}