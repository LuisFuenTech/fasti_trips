import 'package:flutter/material.dart';

import '../name.dart';
import '../info.dart';
import '../comment.dart';

class UserDetails extends StatelessWidget{
  String name = "Luis Fuentes";
  String details = "1 review 5 photos";
  String comment = "There is an amazing Place in Cartagena";
  double stars = 4.5;

  UserDetails(this.name, this.details, this.comment, this.stars, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserName(name),
        UserInfo(details, stars),
        UserComment(comment)
      ],
    );
  }

}