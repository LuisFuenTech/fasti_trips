import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  String pathImage;
  String name;
  String email;

  UserInfo(this.pathImage, this.name, this.email, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userName = Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        name,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );

    final userEmail = Text(
      email,
      style: const TextStyle(
          fontFamily: "Lato", fontSize: 15.0, color: Colors.white30),
    );

    final userPhoto = Container(
      margin: const EdgeInsets.only(right: 20.0),
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white, width: 2.0, style: BorderStyle.solid),
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage))),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [userName, userEmail],
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
      child: Row(
        children: [userPhoto, userDetails],
      ),
    );
  }
}
