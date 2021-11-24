import 'package:flutter/material.dart';

import '../CardImage/main.dart';

class CardImageList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: [
          CardImage("assets/images/playa-1.jpg"),
          CardImage("assets/images/playa-2.jpg"),
          CardImage("assets/images/playa-3.jpg"),
          CardImage("assets/images/clock-1.jpg"),
          CardImage("assets/images/park-1.jpg"),
          CardImage("assets/images/street-1.jpg"),
          CardImage("assets/images/playa-1.jpg"),
          CardImage("assets/images/playa-2.jpg"),
          CardImage("assets/images/playa-3.jpg"),
        ],
      ),
    );
  }

}