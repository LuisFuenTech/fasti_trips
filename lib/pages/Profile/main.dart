import 'package:flutter/material.dart';

import 'header_app_bar.dart';
import 'places/main.dart';
import '../../widgets/Common/Background/main.dart';

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
