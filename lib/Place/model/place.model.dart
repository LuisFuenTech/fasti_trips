import 'package:flutter/material.dart';

class Place {
  String name;
  String description;
  String photoURL;
  int likes;
  String userOwner;
  bool liked;
  String id;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      required this.photoURL,
      required this.likes,
      this.userOwner = "",
      this.liked = false,
      this.id = ""});
}
