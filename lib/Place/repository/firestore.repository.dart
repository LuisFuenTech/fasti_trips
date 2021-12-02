import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_platzi/Place/model/place.model.dart';
import 'package:travel_platzi/User/model/user.model.dart';
import 'package:travel_platzi/User/repository/firestore.repository.dart';
import 'package:travel_platzi/data_sources/firestore.source.dart';

class PlaceRepository {
  Stream<QuerySnapshot> getPlacesStream() =>
      FirestoreSource.db.collection(FirestoreRepository.places).snapshots();
  Stream<QuerySnapshot> getPersonalPlacesStream(String uid) => FirestoreSource
      .db
      .collection(FirestoreRepository.places)
      .where('userOwner',
          isEqualTo: FirestoreSource.db.doc("${FirestoreSource.users}/$uid"))
      .snapshots();

  List<Place> buildPlaces(List<DocumentSnapshot> placesSnapshot, User user) {
    List<Place> places = <Place>[];

    placesSnapshot.sort((a, b) {
      return b['createdAt'].compareTo(a['createdAt']);
    });

    for (DocumentSnapshot placeDoc in placesSnapshot) {
      Place place = Place(
          id: placeDoc.id,
          name: placeDoc["name"],
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

      places.add(place);
    }

    return places;
  }

  Future likeToPlace(Place place, String uid) async {
    FirestoreSource.db.runTransaction((transaction) async {
      DocumentSnapshot placeDoc = await FirestoreSource.db
          .collection(FirestoreSource.places)
          .doc(place.id)
          .get();

      transaction.update(placeDoc.reference, {
        "likes": place.liked ? placeDoc["likes"] + 1 : placeDoc["likes"] - 1,
        'userLiked': place.liked
            ? FieldValue.arrayUnion(
                [FirestoreSource.db.doc("${FirestoreSource.users}/$uid")])
            : FieldValue.arrayRemove(
                [FirestoreSource.db.doc("${FirestoreSource.users}/$uid")])
      });
    });
  }
}
