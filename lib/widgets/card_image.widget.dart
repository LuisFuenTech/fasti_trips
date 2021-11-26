import 'package:flutter/material.dart';

import 'floating_action_button_green.widget.dart';

class CardImageFabIcon extends StatelessWidget {
  final String pathImage;
  final double height;
  final double width;
  final double left;
  final VoidCallback onPressedFanIcon;
  final IconData iconData;

  const CardImageFabIcon(
      {Key? key,
      required this.pathImage,
      required this.width,
      required this.height,
      required this.onPressedFanIcon,
      required this.iconData,
      required this.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.9, 1.1),
      children: [
        Container(
          height: height,
          width: width,
          margin: EdgeInsets.only(left: left),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(pathImage)),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              shape: BoxShape.rectangle,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 7.0))
              ]),
        ),
        FloatingActionButtonGreen(
          iconData: iconData,
          onPressed: onPressedFanIcon,
        )
      ],
    );
  }
}
