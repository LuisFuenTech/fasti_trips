import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_platzi/data_sources/firebase.auth.dart';

class AuthRepository {
  final firebaseAuth = FirebaseAuthSource.firebaseAuth;
  final googleSignIn = FirebaseAuthSource.googleSignIn;

  Future<User?> signIn() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount!.authentication;

    UserCredential userCredential = await firebaseAuth.signInWithCredential(
        GoogleAuthProvider.credential(
            idToken: gSA.idToken, accessToken: gSA.accessToken));

    return userCredential.user;
  }

  Stream<User?> getUserStatus() => FirebaseAuthSource.userStatus;

  Stream<User?> getAuthStatus() => FirebaseAuthSource.authStatus;

  signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }
}
