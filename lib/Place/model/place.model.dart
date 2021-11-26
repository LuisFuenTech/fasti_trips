import 'package:flutter/material.dart';
import 'package:travel_platzi/User/model/user.model.dart';

class Place {
  String name;
  String description;
  String photoURL;
  int likes;
  User userOwner;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      required this.photoURL,
      required this.likes,
      required this.userOwner});
}
