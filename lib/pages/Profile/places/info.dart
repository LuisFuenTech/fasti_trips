import 'package:flutter/material.dart';
import '../../../models/place.dart';
import '../../../widgets/Common/FloatingActionButton/main.dart';

class PlaceInfo extends StatelessWidget {

  InfoPlace placeInfo;

  PlaceInfo(this.placeInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final place = Text(
      this.placeInfo.place,
      style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 20.0,
          fontWeight: FontWeight.bold
      ),
    );

    final placeInfo = Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 10.0
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.placeInfo.where,
                style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                this.placeInfo.type,
                style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold
                ),
              )
            ]
        )
    );

    final steps = Text(
      'Steps ${this.placeInfo.steps}',
      style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber
      ),
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
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
      child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              place,
              placeInfo,
              steps
            ],
          )
      ),
    );

    return Stack(
      alignment: const Alignment(0.8, 1.25),
      children: <Widget>[
        card,
        const FloatingActionButtonGreen()
      ],
    );
  }

}