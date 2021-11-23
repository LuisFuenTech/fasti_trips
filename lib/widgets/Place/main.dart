import 'package:flutter/material.dart';

import 'description.dart';
import 'head.dart';
import '../Common/Button/main.dart';

class Place extends StatelessWidget{
  String namePlace;
  double stars;
  String descriptionPlace;

  Place(this.namePlace, this.stars, this.descriptionPlace,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Head(namePlace, stars),
        Description(namePlace, descriptionPlace),
        Button("Navigate")
      ],
    );
  }
}