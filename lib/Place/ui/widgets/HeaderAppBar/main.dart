import 'package:flutter/material.dart';
import 'package:travel_platzi/widgets/CardImageList/main.dart';
import 'package:travel_platzi/widgets/GradientBack/main.dart';

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