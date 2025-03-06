import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  // 🔥 Initialize FCM
  Future<void> initFCM() async {
    // Request permissions for iOS
    await _firebaseMessaging.requestPermission();

    // Get FCM Token
    String? token = await _firebaseMessaging.getToken();
    print("🔥 FCM Token: $token");

    // Configure foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("🔔 Notification Clicked: ${message.notification?.title}");
    });
  }

  // 🔔 Show Local Notification
  Future<void> _showNotification(RemoteMessage message) async {
    var android = const AndroidNotificationDetails('channelId', 'channelName', importance: Importance.high);
    var platform = NotificationDetails(android: android);

    await _localNotifications.show(
      0,
      message.notification?.title ?? 'New Message',
      message.notification?.body ?? 'You have a new notification!',
      platform,
    );
  }
}
