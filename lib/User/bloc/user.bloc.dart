import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/User/repository/auth.repository.dart';

class UserBloc implements Bloc {
  final authRepository = AuthRepository();

  //Streams
  Stream<User?> get authStatus => FirebaseAuth.instance.authStateChanges();
  Stream<User?> get userStatus => FirebaseAuth.instance.userChanges();

  //Casos de uso
  //1. SignIn Google
  Future<User?> signIn() async => await authRepository.signInFirebase();

  void signOut() async => await authRepository.signOut();

  @override
  void dispose() {}
}
