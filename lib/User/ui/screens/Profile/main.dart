import 'package:flutter/material.dart';
import 'package:travel_platzi/widgets/Background/main.dart';

import 'header_app_bar.dart';
import 'places/main.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        ListView(
          children: [
            HeaderAppBar("Profile"),
            PlacesList()
          ],
        )
      ],
    );
  }
}
