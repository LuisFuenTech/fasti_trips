import 'package:flutter/material.dart';

import '../review_place.widget.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Review("assets/images/profile-1.jpg", "Luis Fuentes",
            "1 review - 5 photos", "There is an amazing Place in Cartagena", 5),
        Review("assets/images/profile-2.jpg", "Fuentech", "3 review - 8 photos",
            "There is an amazing Place in Cartagena", 4.5),
        Review(
            "assets/images/profile-3.png",
            "Rocket Fuentes",
            "4 review - 15 photos",
            "There is an amazing Place in Cartagena",
            4),
        Review(
            "assets/images/park-1.jpg",
            "Varuna Yasas",
            "1 review · 5 photos",
            "There is an amazing place in Sri Lanka",
            3.5),
        Review("assets/images/neon.jpg", "Anahí Salgado", "2 review · 5 photos",
            "There is an amazing place in Sri Lanka", 3),
        Review(
            "assets/images/playa-1.jpg",
            "Gissele Thomas",
            "2 review · 2 photos",
            "There is an amazing place in Sri Lanka",
            2.5),
        Review("assets/images/park-1.jpg", "Varuna Yasas",
            "1 review · 5 photos", "There is an amazing place in Sri Lanka", 2),
        Review("assets/images/neon.jpg", "Anahí Salgado", "2 review · 5 photos",
            "There is an amazing place in Sri Lanka", 1.5),
        Review("assets/images/playa-1.jpg", "Gissele Thomas",
            "2 review · 2 photos", "There is an amazing place in Sri Lanka", 1),
        Review("assets/images/profile-2.jpg", "Fuentech", "3 review - 8 photos",
            "There is an amazing Place in Cartagena", 0.5),
        Review("assets/images/profile-1.jpg", "Luis Fuentes",
            "1 review - 5 photos", "There is an amazing Place in Cartagena", 0),
      ],
    );
  }
}
