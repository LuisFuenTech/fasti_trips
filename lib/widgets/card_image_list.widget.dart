import 'package:flutter/material.dart';

import 'card_image.widget.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = 350.0;
    final double width = 300.0;
    final double left = 20.0;

    return Container(
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: [
          CardImageFabIcon(
            pathImage: "assets/images/playa-1.jpg",
            height: height,
            width: width,
            left: left,
            onPressedFanIcon: () {},
            iconData: Icons.favorite_border,
          ),
          CardImageFabIcon(
            pathImage: "assets/images/playa-2.jpg",
            height: height,
            width: width,
            left: left,
            onPressedFanIcon: () {},
            iconData: Icons.favorite_border,
          ),
          CardImageFabIcon(
            pathImage: "assets/images/playa-3.jpg",
            height: height,
            width: width,
            left: left,
            onPressedFanIcon: () {},
            iconData: Icons.favorite_border,
          ),
          CardImageFabIcon(
            pathImage: "assets/images/clock-1.jpg",
            height: height,
            width: width,
            left: left,
            onPressedFanIcon: () {},
            iconData: Icons.favorite_border,
          ),
          CardImageFabIcon(
            pathImage: "assets/images/park-1.jpg",
            height: height,
            width: width,
            left: left,
            onPressedFanIcon: () {},
            iconData: Icons.favorite_border,
          ),
          CardImageFabIcon(
            pathImage: "assets/images/street-1.jpg",
            height: height,
            width: width,
            left: left,
            onPressedFanIcon: () {},
            iconData: Icons.favorite_border,
          ),
        ],
      ),
    );
  }
}
