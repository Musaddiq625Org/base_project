// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

// Future onDidReceiveLocalNotification(
//   int? id,
//   String? title,
//   String? body,
//   String? payload,
// ) async {
//   log('onDidReceiveLocalNotification');
//   // display a dialog with the notification details, tap ok to go to anther page
//   /* showDialog(
//     context: serviceLocatorInstance<NavigationService>()
//         .navigatorKey
//         .currentState!
//         .context,
//     builder: (BuildContext context) => CupertinoAlertDialog(
//       title: Text(title!),
//       content: Text(body!),
//       actions: [
//         CupertinoDialogAction(
//           isDefaultAction: true,
//           child: Text('Ok'),
//           onPressed: () async {
//             Navigator.of(context, rootNavigator: true).pop();
//           },
//         )
//       ],
//     ),
//   ); */
// }

// Future<void> setupInteractedMessage() async {
//   final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//   if (initialMessage != null) {
//     _handleMessage(initialMessage);
//   }
//   FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
// }

// void _handleMessage(RemoteMessage message) {
//   _navigationOnNotification(
//     message.data['module'],
//     payload: message.data['resource_id'].toString(),
//   );
// }

// Future setupFirebaseAndLocalNotification() async {
//   final initializationSettings = initAndroidIosSettings();
//   initLocalNotificationsPlugin(initializationSettings);

//   await firebaseMessaging.requestPermission();
//   await firebaseMessaging.getToken().then((value) {
//     log('Firebase token $value');
//   });

//   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     final notification = message.data;
//     // AndroidNotification? android = message.notification?.android;

//     // AppleNotification? apple = message.notification?.apple;

//     if (Platform.isAndroid) {
//       log('receiving notification on Android');
//       final initializationSettings = initAndroidIosSettings();
//       initLocalNotificationsPlugin(initializationSettings);
//       await firebaseMessaging.requestPermission();
//       await myBackgroundMessageHandler(notification);
//     } else if (Platform.isIOS) {
//       log('receiving notification on iOS');
//       await myBackgroundMessageHandlerIos(notification);
//     }
//   });
//   /*  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     ToastComponent(context).showToast('onMessageOpenedApp ${message.data.toString()}',
//         toastLength: Toast.LENGTH_LONG);
//   }); */
// }

// InitializationSettings initAndroidIosSettings() {
//   const initializationSettingsAndroid =
//       AndroidInitializationSettings('notification_icon_push');

//   // final initializationSettingsIOS = IOSInitializationSettings();
//   const initializationSettingsIOS = IOSInitializationSettings(
//     requestSoundPermission: false,
//     requestBadgePermission: false,
//     requestAlertPermission: false,
//     onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//   );

//   const initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsIOS,
//   );
//   return initializationSettings;
// }

// void initLocalNotificationsPlugin(
//   InitializationSettings initializationSettings,
// ) {
//   try {
//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification: onSelect,
//     );
//   } catch (_) {
//     log('catching error on flutter local notification: $_');
//   }
// }

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background,
//   // such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   if (message.data.isNotEmpty) {
//     log('Handling a background message: ${message.messageId}');
//     final notification = message.data;
//     /*   ToastComponent(context).showToast(
//         'firebaseMessagingBackgroundHandler ${message.data.toString()}',
//         toastLength: Toast.LENGTH_LONG); */
//     if (Platform.isAndroid) {
//       final initializationSettings = initAndroidIosSettings();
//       initLocalNotificationsPlugin(initializationSettings);
//       await firebaseMessaging.requestPermission();
//       await myBackgroundMessageHandler(notification);
//     } else if (Platform.isIOS) {
//       await myBackgroundMessageHandlerIos(notification);
//     }
//   } else {
//     /* ToastComponent(context).showToast('firebaseMessagingBackgroundHandler
//     without data',
//         toastLength: Toast.LENGTH_LONG); */
//   }
// }

// void onSelectAppClosed() {}

// Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
//   log('myBackgroundMessageHandler message: $message');
//   const msgId = 0; //int.tryParse(message['msg'].toString());
//   /*  ToastComponent(context).showToast(
//       'myBackgroundMessageHandler' + message['data'].toString()); */

//   final androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     'com.google.firebase.messaging.default_notification_channel_id',
//     'your channel name',
//     color: Colors.blue.shade800,
//     importance: Importance.max,
//     priority: Priority.high,
//     /* playSound: true,
//       sound: const RawResourceAndroidNotificationSound
//       ('notificationFileName'), */
//     ticker: 'ticker',
//     channelDescription: 'your channel description',
//   );
//   const iOSPlatformChannelSpecifics = IOSNotificationDetails(
//     presentAlert: true,
//     presentBadge: true,
//     presentSound: true,
//     subtitle: AppConstants.appName,
//     threadIdentifier:
//         'com.google.firebase.messaging.default_notification_channel_id',
//   );
//   final platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//     iOS: iOSPlatformChannelSpecifics,
//   );
//   // await serviceLocatorInstance<NotificationService>()
//   // .showNotificationWithDefaultSound(message);
//   await flutterLocalNotificationsPlugin.show(
//     msgId,
//     message['msgTitle'],
//     message['msgBody'],
//     platformChannelSpecifics,
//     payload: message['data'],
//   );
//   // return Future<void>.value();
// }

// Future<dynamic> myBackgroundMessageHandlerIos(
//   Map<String, dynamic> message,
// ) async {
//   const msgId = 0; //int.tryParse(message['msg'].toString());
//   log('msgId $msgId');
//   final androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     'com.google.firebase.messaging.default_notification_channel_id',
//     'your channel name',
//     color: Colors.blue.shade800,
//     importance: Importance.max,
//     priority: Priority.high,
//     ticker: 'ticker',
//     channelDescription: 'your channel description',
//   );
//   const iOSPlatformChannelSpecifics = IOSNotificationDetails(
//     presentAlert: true,
//     presentBadge: true,
//     presentSound: true,
//     subtitle: AppConstants.appName,
//     threadIdentifier:
//         'com.google.firebase.messaging.default_notification_channel_id',
//   );
//   final platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//     iOS: iOSPlatformChannelSpecifics,
//   );
//   // await serviceLocatorInstance<NotificationService>()
//   // .showNotificationWithDefaultSound(message);
//   await flutterLocalNotificationsPlugin.show(
//     msgId,
//     message['msgTitle'],
//     message['msgBody'],
//     platformChannelSpecifics,
//     payload: message['data'],
//   );
// }

// String? requestedNewToken;

// Future<String?> requestGenerateFirebaseToken() async {
//   requestedNewToken = await firebaseMessaging.getToken();
//   log('firebase token: $requestedNewToken');
//   return requestedNewToken;
// }

// Future<void> removeFirebaseToken() async {
//   return FirebaseMessaging.instance.deleteToken();
// }

// Future onSelect(String? data) async {
//   final Map res = json.decode(data!);
//   log(res.toString());
//   // ToastComponent(context).showToast('onSelect $res', toastLength: Toast.LENGTH_LONG);
//   _navigationOnNotification(
//     res['module'],
//     payload: res['resource_id'].toString(),
//   );
// }

// void onSelectSplashNotification(String? data, {bool comingFromSplash = false}) {
//   final Map res = json.decode(data!);
//   log(res.toString());
//   // ToastComponent(context).showToast('onSelect $res', toastLength: Toast.LENGTH_LONG);
//   _navigationOnNotification(
//     res['module'],
//     payload: res['resource_id'].toString(),
//     comingFromSplash: comingFromSplash,
//     data: data,
//   );
// }

// void _navigationOnNotification(
//   String navigate, {
//   String? payload,
//   bool comingFromSplash = false,
//   String? data,
// }) {
//   /*  final BottomNavIndexController bottomNavIndexController = Get.find();
//   log('_navigationOnNotification: $navigate');
//   log('currentRoute: ${Get.currentRoute}');
//   if (navigate == NotificationNavigationEnum.event.toString()) {
//     if (comingFromSplash) {
//       Get.to(() => BottomNavBarScreen(
//             payloadData: data,
//           ));
//     } else {
//       Get.to(
//         () => MyTicketsDetailScreen(
//           eventId: payload ?? '0',
//         ),
//       );
//     }
//   } else if (navigate == NotificationNavigationEnum.eventCalender.toString()) {
//     Get.offAll(() => const BottomNavBarScreen(index: 3));
//   } else if (navigate == NotificationNavigationEnum.ticket.toString()) {
//    /* if(Get.currentRoute == '/BottomNavBarScreen') {
//       bottomNavIndexController.currentDashboardIndex.value = 0;
//     }
//     else {
//       Get.offAll(
//               () => BottomNavBarScreen(index: 0, myTicketId: payload ?? '0'));
//     }*/
//     Get.offAll(
//             () => BottomNavBarScreen(index: 0, myTicketId: payload ?? '0'));
//   } else if (navigate == NotificationNavigationEnum.home.toString()) {
//     Get.offAll(() => const BottomNavBarScreen(index: 2));
//   } */
// }

// /* _pushRoute(Widget _widget) {
//   // Get.to(_widget);
// } */
