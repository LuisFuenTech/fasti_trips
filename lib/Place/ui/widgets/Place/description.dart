import 'dart:ui';

import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  String namePlace;
  String descriptionPlace;

  Description(this.namePlace, this.descriptionPlace,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Text(descriptionPlace,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF56575a)),
            textAlign: TextAlign.justify));
  }
}
