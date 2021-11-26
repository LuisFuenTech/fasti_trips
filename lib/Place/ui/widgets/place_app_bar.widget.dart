import 'package:flutter/material.dart';
import 'package:travel_platzi/widgets/background.widget.dart';
import 'package:travel_platzi/widgets/card_image_list.widget.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        //GradientBack(height: 350.0),
        CardImageList()
      ],
    );
  }
}
