import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_platzi/User/repository/firebase.auth.dart';

class AuthRepository {
  final firebaseAuthAPI = FirebaseAuthAPI();

  Future<User?> signInFirebase() async => firebaseAuthAPI.signIn();
  signOut() async => firebaseAuthAPI.signOut();
}
