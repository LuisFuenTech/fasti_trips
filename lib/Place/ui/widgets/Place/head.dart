import 'package:flutter/material.dart';
import 'package:travel_platzi/widgets/start_list.widget.dart';

class Head extends StatelessWidget {
  String namePlace;
  double starsAmount;

  Head(this.namePlace, this.starsAmount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = Container(
      margin: const EdgeInsets.only(top: 320.0, left: 20.0, right: 20.0),
      child: Text(
        namePlace,
        style: const TextStyle(
            fontFamily: "Lato", fontSize: 30.0, fontWeight: FontWeight.w900),
        textAlign: TextAlign.left,
      ),
    );

    return Row(
      children: [title, StarList(starsAmount, 325.0, 25.0)],
    );
  }
}
