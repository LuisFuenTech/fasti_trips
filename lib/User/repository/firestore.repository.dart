import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_platzi/Place/model/place.model.dart';
import 'package:travel_platzi/User/model/user.model.dart' as user_model;
import 'package:travel_platzi/data_sources/firebase.source.dart';
import 'package:travel_platzi/data_sources/firestore.source.dart';

class FirestoreRepository {
  final FirebaseFirestore _db = FirestoreSource.db;
  static String get users => FirestoreSource.users;
  static String get places => FirestoreSource.places;
  static FirebaseAuth get firebaseAuth => FirebaseSource.firebaseAuth;

  Future<void> updateUserData(user_model.User user) async {
    DocumentReference ref = _db.collection(users).doc(user.uid);

    return await ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'places': user.places,
      'favoritePlaces': user.favoritePlaces,
      'deviceToken': user.deviceToken,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlace = _db.collection(places);

    DocumentReference docPlace = await refPlace.add({
      "name": place.name,
      "description": place.description,
      "likes": place.likes,
      "userOwner": _db.doc("$users/${place.userOwner}"),
      'photoURL': place.photoURL,
      "userLiked": [],
      'createdAt': DateTime.now()
    });

    DocumentSnapshot snapPLace = await docPlace.get();
    DocumentReference refUsers = _db.collection(users).doc(place.userOwner);

    await refUsers.update({
      'places': FieldValue.arrayUnion([snapPLace.reference])
    });
  }

  List<Place> buildUserPlaces(
      List<DocumentSnapshot> placesSnapshot, user_model.User user) {
    List<Place> profilePlaces = <Place>[];

    placesSnapshot.sort((a, b) {
      return b['createdAt'].compareTo(a['createdAt']);
    });

    for (DocumentSnapshot placeDoc in placesSnapshot) {
      Place place = Place(
          id: placeDoc.id,
          name: placeDoc['name'],
          description: placeDoc["description"],
          photoURL: placeDoc["photoURL"],
          likes: placeDoc["likes"],
          liked: false);

      List userLikedRefs = placeDoc["userLiked"];

      for (DocumentReference userRef in userLikedRefs) {
        if (user.uid == userRef.id) {
          place.liked = true;
        }
      }

      profilePlaces.add(place);
    }

    return profilePlaces;
  }
}
