import 'package:flutter/material.dart';
import 'package:travel_platzi/widgets/start_list.widget.dart';
import 'package:travel_platzi/widgets/user_image.widget.dart';

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
    final userName = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: const TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final reviewDetails = Container(
      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFa3a5a7)),
      ),
    );

    final reviewComment = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontFamily: "Lato", fontSize: 13.0, fontWeight: FontWeight.w900),
      ),
    );

    return Row(
      children: [
        UserPhoto(pathImage),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userName,
            Row(
              children: [reviewDetails, StarList(stars, 0, 15.0)],
            ),
            reviewComment
          ],
        )
      ],
    );
  }
}
