import 'package:firebase_messaging/firebase_messaging.dart';

class NotifikationService {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  void reqstNotificationPermission() async {
    NotificationSettings notificationSettings =
        await firebaseMessaging.requestPermission(
            alert: true,
            sound: true,
            badge: true,
            carPlay: true,
            provisional: true,
            announcement: true,
            criticalAlert: true);
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
    } else {}
  }
}
