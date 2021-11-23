import 'package:flutter/material.dart';

import '../Common/CardImageList/main.dart';
import '../Common/GradientBack/main.dart';

class HeaderAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBack("Popular", 250.0),
        CardImageList()
      ],
    );
  }

}