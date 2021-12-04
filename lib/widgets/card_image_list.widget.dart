import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/Place/model/place.model.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/User/model/user.model.dart';
import 'package:travel_platzi/widgets/card_image_fab_icon.widget.dart';

class CardImageList extends StatefulWidget {
  User user;

  CardImageList({Key? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CardImageListState();
  }
}

class _CardImageListState extends State<CardImageList> {
  late UserBloc _userBloc;
  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
        height: 350.0,
        margin: const EdgeInsets.only(top: 20.0),
        child: StreamBuilder(
          stream: _userBloc.placesStreams,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.cyan,
                  ),
                );
              default:
                return listViewPlaces(
                    _userBloc.buildPlaces(snapshot.data.docs, widget.user));
            }
          },
        ));
  }

  Widget listViewPlaces(List<Place> places) {
    //_userBloc.placeSelectedStreamController.add(places[0]);

    void setLiked(Place place) {
      place.liked = !place.liked;
      _userBloc.likeToPlace(place, widget.user.uid);
      place.likes += place.liked ? 1 : -1;
      _userBloc.placeSelectedStreamController.add(place);
    }

    return ListView(
      padding: const EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: places.map((place) {
        return GestureDetector(
          onTap: () {
            _userBloc.placeSelectedStreamController.add(place);
          },
          child: CardImageFabIcon(
              pathImage: place.photoURL,
              width: 300.0,
              height: 250.0,
              onPressedFanIcon: () {
                setLiked(place);
              },
              iconData: place.liked ? Icons.favorite : Icons.favorite_border,
              internet: true,
              left: 20.0),
        );
      }).toList(),
    );
  }
}
