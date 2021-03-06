import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:travel_platzi/data_sources/firebase.source.dart';

class FirebaseService {
  static final StreamController<Map<String, dynamic>> _notificationStream =
      StreamController.broadcast();
  static Stream<Map<String, dynamic>> get notificationStream =>
      _notificationStream.stream;

  static Future<void> _onBackgroundAppNotificationHandler(
      RemoteMessage message) async {
    _notificationStream.add(message.data);
  }

  static Future<void> _onMessageAppNotificationHandler(
      RemoteMessage message) async {
    _notificationStream.add(message.data);
  }

  static Future<void> _onOpenAppNotificationHandler(
      RemoteMessage message) async {
    _notificationStream.add(message.data);
  }

  static Future<FirebaseApp> initializeApp() async {
    return await Firebase.initializeApp();
  }

  static Future<void> initializeNotificationApp() async {
    await getDeviceToken();
    FirebaseSource.onBackgroundMessage(_onBackgroundAppNotificationHandler);
    FirebaseSource.onMessageOpenedApp(_onOpenAppNotificationHandler);

    //Uncomment when want to implement something when user is using the app
    //FirebaseSource.onMessage(_onMessageAppNotificationHandler);
  }

  static Future<String?> getDeviceToken() async {
    return await FirebaseSource.firebaseMessaging.getToken();
  }

  static closeStreams() {
    _notificationStream.close();
  }
}
