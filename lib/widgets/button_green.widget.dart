import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final height;
  final width;
  final String text;
  final VoidCallback onPressed;
  Icon icon = const Icon(Icons.add_reaction);

  ButtonGreen(
      {key,
      required this.text,
      required this.onPressed,
      this.height,
      this.width,
      required this.icon})
      : super(key: key);

  @override
  _ButtonGreenState createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: const LinearGradient(
              colors: [Color(0xFFa7ff84), Color(0xFF1cbb78)],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      child: InkWell(
        onTap: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon,
            Text(
              widget.text,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
