import 'package:flutter/material.dart';
import 'package:travel_platzi/User/model/user.model.dart';
import 'package:travel_platzi/helpers/files.helper.dart';

class UserInfo extends StatelessWidget {
  User user;

  UserInfo({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userName = Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        user.name,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );

    final userEmail = Text(
      user.email,
      style: const TextStyle(
          fontFamily: "Lato", fontSize: 15.0, color: Colors.white30),
    );

    //print("photoooo -> ${user.photoURL}");
    final userPhoto = Container(
      margin: const EdgeInsets.only(right: 20.0),
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white, width: 2.0, style: BorderStyle.solid),
          image: DecorationImage(
              fit: BoxFit.cover,
              //image: AssetImage(user.photoURL),
              image: FilesHelper().pictureValidation(user.photoURL, true))),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [userName, userEmail],
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      child: Row(
        children: [userPhoto, userDetails],
      ),
    );
  }
}
