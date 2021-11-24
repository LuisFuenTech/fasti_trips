import 'package:flutter/material.dart';
import 'package:travel_platzi/Place/model/place.dart';
import 'place.dart';

class PlacesList extends StatelessWidget {

  InfoPlace info = InfoPlace('Playa Blanca', 'Hiking. Water fall hunting. Natural bath', 'Scenery & Photography', '123,123,123');
  InfoPlace info2 = InfoPlace('San Andrés Island', 'Hiking. Water fall hunting. Natural bath', 'Scenery & Photography', '321,321,321');
  InfoPlace info3 = InfoPlace("Simón Bolívar's Park", 'Hiking. Water fall hunting. Natural bath', 'Scenery & Photography', '321,321,321');
  InfoPlace info4 = InfoPlace('Playa Blanca', 'Hiking. Water fall hunting. Natural bath', 'Scenery & Photography', '123,123,123');
  InfoPlace info5 = InfoPlace('San Andrés Island', 'Hiking. Water fall hunting. Natural bath', 'Scenery & Photography', '321,321,321');
  InfoPlace info6 = InfoPlace("Simón Bolívar's Park", 'Hiking. Water fall hunting. Natural bath', 'Scenery & Photography', '321,321,321');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: Column(
        children: <Widget>[
          Place('assets/images/playa-1.jpg', info),
          Place('assets/images/playa-2.jpg', info2),
          Place('assets/images/park-1.jpg', info3),
          Place('assets/images/street-1.jpg', info4),
          Place('assets/images/clock-1.jpg', info5),
          Place('assets/images/playa-3.jpg', info3),
        ],
      ),
    );
  }

}