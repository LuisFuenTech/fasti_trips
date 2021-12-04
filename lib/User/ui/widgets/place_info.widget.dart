import 'package:flutter/material.dart';
import 'package:travel_platzi/Place/model/place.model.dart';
import 'package:travel_platzi/widgets/floating_action_button_green.widget.dart';

class PlaceInfo extends StatefulWidget {
  Place placeInfo;
  final VoidCallback onPressedFanIcon;
  final IconData iconData;

  PlaceInfo(this.placeInfo,
      {Key? key, required this.onPressedFanIcon, required this.iconData})
      : super(key: key);

  @override
  State<PlaceInfo> createState() => _PlaceInfoState();
}

class _PlaceInfoState extends State<PlaceInfo> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final place = Text(
      widget.placeInfo.name,
      style: const TextStyle(
          fontFamily: 'Lato', fontSize: 20.0, fontWeight: FontWeight.bold),
    );

    final placeInfo = Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.placeInfo.description,
                style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              )
            ]));

    final hearts = Text(
      '${widget.placeInfo.likes}',
      style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber),
    );

    final card = Container(
      width: screenWidth * 0.65,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0))
          ]),
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              place,
              placeInfo,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Icons.favorite, color: Colors.amber),
                  hearts
                ],
              )
            ],
          )),
    );

    return Stack(
      alignment: const Alignment(0.8, 1.25),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          iconData: widget.iconData,
          onPressed: widget.onPressedFanIcon,
        )
      ],
    );
  }
}
