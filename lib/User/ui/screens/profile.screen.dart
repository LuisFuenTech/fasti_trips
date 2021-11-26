import 'package:flutter/material.dart';
import 'package:travel_platzi/widgets/background.widget.dart';

import '../widgets/place_list.widget.dart';
import '../widgets/profile_app_bar.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        ListView(
          children: [ProfileAppBar(), PlacesList()],
        )
      ],
    );
  }
}
