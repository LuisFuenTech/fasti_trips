import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_platzi/User/model/user.model.dart';
import 'package:travel_platzi/data_sources/firestore.db.dart';

class FirestoreRepository {
  final db = FirestoreSource.db;
  final users = FirestoreSource.users;
  final places = FirestoreSource.places;

  updateUserData(User user) async {
    DocumentReference ref = db.collection(users).doc(user.uid);

    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'places': user.places,
      'favoritePlaces': user.favoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }
}
