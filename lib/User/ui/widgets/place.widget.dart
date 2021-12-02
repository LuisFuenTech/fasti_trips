import 'package:flutter/material.dart';
import 'package:travel_platzi/Place/model/place.model.dart';
import 'package:travel_platzi/helpers/files.helper.dart';

import 'place_info.widget.dart';

class PlaceWidget extends StatelessWidget {
  Place place;

  PlaceWidget(this.place, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photoCard = Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 70.0),
      height: 220.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: FilesHelper().pictureValidation(place.photoURL, true)),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          //color: const Color.fromRGBO(255, 0, 0, 0.5)
          gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(66, 104, 211, 0.5),
                Color.fromRGBO(88, 76, 209, 0.5)
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0))
          ]),
    );

    return Stack(
      alignment: const Alignment(0.0, 0.8),
      children: <Widget>[photoCard, PlaceInfo(place)],
    );
  }
}
