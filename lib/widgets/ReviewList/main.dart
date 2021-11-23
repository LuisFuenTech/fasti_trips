import 'package:flutter/material.dart';

import 'review/main.dart';

class ReviewList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Review("assets/images/profile-1.jpg", "Luis Fuentes", "1 review - 5 photos", "There is an amazing Place in Cartagena", 3.5),
        Review("assets/images/profile-2.jpg", "Fuentech", "3 review - 8 photos", "There is an amazing Place in Cartagena", 2.5),
        Review("assets/images/profile-3.png", "Rocket Fuentes", "4 review - 15 photos", "There is an amazing Place in Cartagena", 4),
        Review("assets/images/profile-1.jpg", "Luis Fuentes", "1 review - 5 photos", "There is an amazing Place in Cartagena", 3.5),
        Review("assets/images/profile-2.jpg", "Fuentech", "3 review - 8 photos", "There is an amazing Place in Cartagena", 2.5),
        Review("assets/images/profile-3.png", "Rocket Fuentes", "4 review - 15 photos", "There is an amazing Place in Cartagena", 4),
      ],
    );
  }

}