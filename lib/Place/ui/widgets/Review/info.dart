import 'package:flutter/material.dart';

import '../../../../widgets/StartList/main.dart';

class UserInfo extends StatelessWidget{
  String information;
  double starsAmount;

  UserInfo(this.information, this.starsAmount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final info = Container(
      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
      child: Text(
        information,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFa3a5a7)),
      ),
    );

    return Row(
      children: [
        info,
        StarList(starsAmount, 0, 15.0)
      ],
    );
  }

}