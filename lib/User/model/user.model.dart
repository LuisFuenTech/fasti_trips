import 'package:flutter/material.dart';
import 'package:travel_platzi/Place/model/place.model.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  List<Place> places;
  List<Place> favoritePlaces;
  String deviceToken;

  User(
      {Key? key,
      required this.uid,
      required this.name,
      required this.email,
      required this.photoURL,
      this.places = const [],
      this.favoritePlaces = const [],
      this.deviceToken = ""});
}
