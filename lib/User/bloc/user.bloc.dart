import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/User/model/user.model.dart' as user_model;
import 'package:travel_platzi/User/repository/auth.repository.dart';
import 'package:travel_platzi/User/repository/firestore.repository.dart';

class UserBloc implements Bloc {
  final authRepository = AuthRepository();
  final firestoreRepository = FirestoreRepository();

  //Streams
  Stream<User?> get authStatus => authRepository.getUserStatus();
  Stream<User?> get userStatus => authRepository.getUserStatus();

  //Casos de uso
  //1. SignIn Google
  Future<User?> signIn() => authRepository.signIn();

  void signOut() => authRepository.signOut();

  void updateUserData(user_model.User user) =>
      firestoreRepository.updateUserData(user);

  @override
  void dispose() {}
}
