import 'package:flutter/material.dart';

import '../../../../widgets/UserImage/main.dart';
import 'name.dart';
import 'info.dart';
import 'comment.dart';

class Review extends StatelessWidget {
  String name = "Luis Fuentes";
  String details = "1 review 5 photos";
  String comment = "There is an amazing Place in Cartagena";
  String pathImage = "assets/images/profile-1.jpg";
  double stars = 4.5;

  Review(this.pathImage, this.name, this.details, this.comment, this.stars,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserPhoto(pathImage),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserName(name),
            UserInfo(details, stars),
            UserComment(comment)
          ],
        )
      ],
    );
  }
}
