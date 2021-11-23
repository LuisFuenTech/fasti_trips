import 'package:flutter/material.dart';

import 'userDetails/main.dart';
import '../../Common/UserImage/main.dart';

class Review extends StatelessWidget{
  String name = "Luis Fuentes";
  String details = "1 review 5 photos";
  String comment = "There is an amazing Place in Cartagena";
  String pathImage = "assets/images/profile-1.jpg";
  double stars = 4.5;

  Review(this.pathImage, this.name, this.details, this.comment, this.stars, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        UserPhoto(pathImage),
        UserDetails(name, details, comment, stars)
      ],
    );
  }

}