import 'package:flutter/material.dart';
import 'package:travel_platzi/widgets/button.widget.dart';
import 'package:travel_platzi/widgets/start_list.widget.dart';

class PlaceInfo extends StatelessWidget {
  String namePlace;
  double stars;
  String descriptionPlace;

  PlaceInfo(this.namePlace, this.stars, this.descriptionPlace, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = Container(
      margin: const EdgeInsets.only(top: 330.0, left: 20.0, right: 20.0),
      child: Text(
        namePlace,
        style: const TextStyle(
            fontFamily: "Lato", fontSize: 30.0, fontWeight: FontWeight.w900),
        textAlign: TextAlign.left,
      ),
    );

    final description = Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Text(descriptionPlace,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF56575a)),
            textAlign: TextAlign.justify));

    return Column(
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
  }
}
