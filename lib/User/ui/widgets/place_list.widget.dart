import 'package:flutter/material.dart';
import 'package:travel_platzi/Place/model/place.model.dart';
import 'package:travel_platzi/User/model/user.model.dart';

import 'place.widget.dart';

class PlacesList extends StatelessWidget {
  Place info = Place(
      name: 'Playa Blanca',
      description: 'Hiking. Water fall hunting. Natural bath',
      photoURL: "Scenery & Photography",
      likes: 123123123,
      userOwner: User(
          uid: "",
          name: "",
          email: "",
          photoURL: "",
          places: [],
          favoritePlaces: []));
  Place info2 = Place(
      name: 'San Andrés Island',
      description: 'Hiking. Water fall hunting. Natural bath',
      photoURL: "Scenery & Photography",
      likes: 123123123,
      userOwner: User(
          uid: "",
          name: "",
          email: "",
          photoURL: "",
          places: [],
          favoritePlaces: []));
  Place info3 = Place(
      name: "Simón Bolívar's Park",
      description: 'Hiking. Water fall hunting. Natural bath',
      photoURL: "Scenery & Photography",
      likes: 123123123,
      userOwner: User(
          uid: "",
          name: "",
          email: "",
          photoURL: "",
          places: [],
          favoritePlaces: []));
  Place info4 = Place(
      name: 'Playa Blanca',
      description: 'Hiking. Water fall hunting. Natural bath',
      photoURL: "Scenery & Photography",
      likes: 123123123,
      userOwner: User(
          uid: "",
          name: "",
          email: "",
          photoURL: "",
          places: [],
          favoritePlaces: []));
  Place info5 = Place(
      name: 'San Andrés Island',
      description: 'Hiking. Water fall hunting. Natural bath',
      photoURL: "Scenery & Photography",
      likes: 123123123,
      userOwner: User(
          uid: "",
          name: "",
          email: "",
          photoURL: "",
          places: [],
          favoritePlaces: []));
  Place info6 = Place(
      name: "Simón Bolívar's Park",
      description: 'Hiking. Water fall hunting. Natural bath',
      photoURL: "Scenery & Photography",
      likes: 123123123,
      userOwner: User(
          uid: "",
          name: "",
          email: "",
          photoURL: "",
          places: [],
          favoritePlaces: []));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          PlaceWidget('assets/images/playa-1.jpg', info),
          PlaceWidget('assets/images/playa-2.jpg', info2),
          PlaceWidget('assets/images/park-1.jpg', info3),
          PlaceWidget('assets/images/street-1.jpg', info4),
          PlaceWidget('assets/images/clock-1.jpg', info5),
          PlaceWidget('assets/images/playa-3.jpg', info3),
        ],
      ),
    );
  }
}
