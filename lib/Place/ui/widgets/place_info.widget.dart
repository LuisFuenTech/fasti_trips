import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/Place/model/place.model.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/widgets/button.widget.dart';

class PlaceInfo extends StatelessWidget {
  String namePlace;
  double stars;
  String descriptionPlace;

  PlaceInfo(this.namePlace, this.stars, this.descriptionPlace, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.placeSelectedStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Place place = snapshot.data;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Head(namePlace, stars),
                titleStarsWidget(place),
                descriptionWidget(place.description),
                Button(
                  buttonText: "Navigate",
                  onPressed: () {},
                )
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      top: 400.0, left: 20.0, right: 20.0),
                  child: const Text(
                    "Selecciona un lugar",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            );
          }
        });

    /*
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Head(namePlace, stars),
        Row(
          children: [title, StarList(stars, 325.0, 25.0)],
        ),
        description,
        Button(
          buttonText: "Navigate",
          onPressed: () {},
        )
      ],
    );
    */
  }

  Widget titleStarsWidget(Place place) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 350.0, left: 20.0, right: 20.0),
          child: Text(
            place.name,
            style: const TextStyle(
                fontFamily: "Lato",
                fontSize: 30.0,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 360.0,
          ),
          child: Row(
            children: [
              const Icon(Icons.favorite, color: Colors.amber),
              Text(
                "${place.likes}",
                style: const TextStyle(
                    fontFamily: "Lato",
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.amber),
                textAlign: TextAlign.left,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget descriptionWidget(String descriptionPlace) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Text(descriptionPlace,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF56575a)),
            textAlign: TextAlign.justify));
  }
}
