import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/Place/model/place.model.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/User/model/user.model.dart';

class PlacesList extends StatelessWidget {
  final User user;
  late UserBloc userBloc;

  PlacesList({Key? key, required this.user}) : super(key: key);

  Place info = Place(
    name: 'Playa Blanca',
    description: 'Hiking. Water fall hunting. Natural bath',
    photoURL: "Scenery & Photography",
    likes: 123123123,
  );
  Place info2 = Place(
      name: 'San Andrés Island',
      description: 'Hiking. Water fall hunting. Natural bath',
      photoURL: "Scenery & Photography",
      likes: 123123123);
  Place info3 = Place(
      name: "Simón Bolívar's Park",
      description: 'Hiking. Water fall hunting. Natural bath',
      photoURL: "Scenery & Photography",
      likes: 123123123);
  Place info4 = Place(
    name: 'Playa Blanca',
    description: 'Hiking. Water fall hunting. Natural bath',
    photoURL: "Scenery & Photography",
    likes: 123123123,
  );
  Place info5 = Place(
    name: 'San Andrés Island',
    description: 'Hiking. Water fall hunting. Natural bath',
    photoURL: "Scenery & Photography",
    likes: 123123123,
  );
  Place info6 = Place(
    name: "Simón Bolívar's Park",
    description: 'Hiking. Water fall hunting. Natural bath',
    photoURL: "Scenery & Photography",
    likes: 123123123,
  );

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
        stream: userBloc.getPersonalPlacesStream(user.uid),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.cyan,
                  ),
                );
              default:
                return Column(
                  children: userBloc.buildUserPlaces(snapshot.data.docs),
                );
            }
          }
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.cyan,
            ),
          );
        },
      ),
    );
  }

  /*
  Column(
        children: <Widget>[
          PlaceWidget('assets/images/playa-1.jpg', info),
          PlaceWidget('assets/images/playa-2.jpg', info2),
          PlaceWidget('assets/images/park-1.jpg', info3),
          PlaceWidget('assets/images/street-1.jpg', info4),
          PlaceWidget('assets/images/clock-1.jpg', info5),
          PlaceWidget('assets/images/playa-3.jpg', info3),
        ],
      )
  * */
}
