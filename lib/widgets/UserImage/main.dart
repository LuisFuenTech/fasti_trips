import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget{
  String pathImage;

  UserPhoto(this.pathImage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
          DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage))),
    );
  }

}