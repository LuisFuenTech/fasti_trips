import 'package:flutter/material.dart';

import 'star.widget.dart';

class StarList extends StatelessWidget {
  double amount = 0;
  double top = 323.0;
  double size = 25.0;

  StarList(this.amount, this.top, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> fillStars(double stars) {
      List<Widget> starsList = List.filled(5, Star("empty", top, size));
      int starBase = stars.floor();
      double decimal = stars - stars.floor();

      for (var i = 0; i < stars.floor(); i++) {
        starsList[i] = Star("", top, size);
      }

      if (decimal > 0) starsList[starBase] = Star("half", top, size);

      return starsList.toList();
    }

    return Row(
      children: fillStars(amount),
    );
  }
}
