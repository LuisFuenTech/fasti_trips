import 'package:flutter/material.dart';
import 'package:travel_platzi/widgets/card_image_list.widget.dart';
import 'package:travel_platzi/widgets/gradient_back.widget.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [GradientBack("Popular", 250.0), CardImageList()],
    );
  }
}
