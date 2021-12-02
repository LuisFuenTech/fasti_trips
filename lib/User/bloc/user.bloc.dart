import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/Place/model/place.model.dart';
import 'package:travel_platzi/Place/repository/firestore.repository.dart';
import 'package:travel_platzi/Place/repository/storage.repository.dart';
import 'package:travel_platzi/User/model/user.model.dart' as user_model;
import 'package:travel_platzi/User/repository/auth.repository.dart';
import 'package:travel_platzi/User/repository/firestore.repository.dart';
import 'package:travel_platzi/User/ui/widgets/place.widget.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();
  final _firestoreRepository = FirestoreRepository();
  final _storageRepository = StorageRepository();
  final _placeRepository = PlaceRepository();

  StreamController placeSelectedStreamController = StreamController();
  Stream get placeSelectedStream => placeSelectedStreamController.stream;
  StreamSink get placeSelectedSink => placeSelectedStreamController.sink;
  Stream<User?> get authStatusStream => _authRepository.getUserStatusStream();
  Stream<User?> get userStatusStream => _authRepository.getUserStatusStream();
  Stream<QuerySnapshot> get placesStream => _placeRepository.getPlacesStream();
  Stream<QuerySnapshot> get placesStreams => placesStream;
  Stream<QuerySnapshot> getPersonalPlacesStream(String uid) =>
      _placeRepository.getPersonalPlacesStream(uid);
  User? get currentUser => _authRepository.getCurrentUser();

  List<Place> buildPlaces(
          List<DocumentSnapshot> placesSnapshot, user_model.User user) =>
      _placeRepository.buildPlaces(placesSnapshot, user);

  Future<User?> signIn() => _authRepository.signIn();

  Future<void> signOut() async {
    await updateUserData(user_model.User(
        uid: currentUser!.uid,
        name: currentUser!.displayName as String,
        email: currentUser!.email as String,
        photoURL: currentUser!.photoURL as String,
        places: [],
        favoritePlaces: []));
    _authRepository.signOut();
  }

  Future<void> updateUserData(user_model.User user) async =>
      await _firestoreRepository.updateUserData(user);

  Future<void> updatePlaceData(Place place) {
    return _firestoreRepository.updatePlaceData(place);
  }

  uploadFile(String path, File file) {
    return _storageRepository.uploadFile(path, file);
  }

  List<PlaceWidget> buildUserPlaces(List<DocumentSnapshot> placesSnapshot) =>
      _firestoreRepository.buildUserPlaces(placesSnapshot);

  Future likeToPlace(Place place, String uid) =>
      _placeRepository.likeToPlace(place, uid);

  @override
  void dispose() {}
}
