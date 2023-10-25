import 'package:app_settings/app_settings.dart';
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
        AuthorizationStatus.provisional) {
    } else {
      AppSettings.openAppSettings();
    }
  }

  Future<String> getDeviceToken() async {
    String? token = await firebaseMessaging.getToken();
    return token!;
  }
}
