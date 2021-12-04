import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/Place/model/place.model.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/User/model/user.model.dart';
import 'package:travel_platzi/User/ui/widgets/place.widget.dart';

class PlacesList extends StatefulWidget {
  final User user;

  PlacesList({Key? key, required this.user}) : super(key: key);

  @override
  State<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  late UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
        stream: _userBloc.getPersonalPlacesStream(widget.user.uid),
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
                return listViewUserPlaces(
                    _userBloc.buildUserPlaces(snapshot.data.docs, widget.user));
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

  Widget listViewUserPlaces(List<Place> places) {
    void setLiked(Place place) {
      place.liked = !place.liked;
      _userBloc.likeToPlace(place, widget.user.uid);
      place.likes += place.liked ? 1 : -1;
      _userBloc.placeSelectedStreamController.add(place);
    }

    return Column(
      children: places.map((place) {
        return PlaceWidget(
          place,
          iconData: place.liked ? Icons.favorite : Icons.favorite_border,
          onPressedFanIcon: () {
            setLiked(place);
          },
        );
      }).toList(),
    );
  }
}
