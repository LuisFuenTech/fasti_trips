import 'package:flutter/material.dart';

class Star extends StatelessWidget{
  String type = "";
  double top = 323.0;
  double size = 25.0;

  Star(this.type, this.top, this.size);

  @override
  Widget build(BuildContext context) {
    final star = Container(
      margin: EdgeInsets.only(top: top, right: 3.0),
      child: Icon(
        Icons.star,
        color: const Color(0xfff2c611),
        size: size,
      )
    );

    final starHalf = Container(
      margin: EdgeInsets.only(top: top, right: 3.0),
      child: Icon(
        Icons.star_half,
        color: const Color(0xfff2c611),
        size: size,
      ),
    );

    final starEmpty = Container(
      margin: EdgeInsets.only(top: top, right: 3.0),
      child: Icon(
        Icons.star_border,
        color: const Color(0xfff2c611),
        size: size,
      ),
    );

    switch(type){
      case 'half':
        return starHalf;
      case 'empty':
        return starEmpty;
      default:
        return star;
    }
  }

}