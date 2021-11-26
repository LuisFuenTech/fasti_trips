import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthSource {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn();
  static Stream<User?> get userStatus => firebaseAuth.userChanges();
  static Stream<User?> get authStatus => firebaseAuth.authStateChanges();
}
