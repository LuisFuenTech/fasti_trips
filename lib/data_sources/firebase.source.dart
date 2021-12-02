import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseSource {
  /*
   * Firebase Auth
   */
  static FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  static GoogleSignIn get googleSignIn => GoogleSignIn();
  static Stream<User?> get userStatusStream => firebaseAuth.userChanges();
  static Stream<User?> get authStatusStream => firebaseAuth.authStateChanges();
  static User? get currentUser => firebaseAuth.currentUser;
  static FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  /*
   * Firebase Cloud Messaging
   */
  static void onBackgroundMessage(BackgroundMessageHandler handler) {
    FirebaseMessaging.onBackgroundMessage(handler);
  }

  static onMessage(handler) {
    FirebaseMessaging.onMessage.listen(handler);
  }

  static onMessageOpenedApp(handler) {
    FirebaseMessaging.onMessageOpenedApp.listen(handler);
  }
}
