import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  bool mini;
  final icon;
  double iconSize;
  final color;
  final VoidCallback onPressed;

  CircleButton(this.mini, this.icon, this.iconSize, this.color, this.onPressed,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }
}

class _CircleButton extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
      backgroundColor: widget.color,
      mini: widget.mini,
      onPressed: widget.onPressed,
      child: Icon(
        widget.icon,
        size: widget.iconSize,
        color: const Color(0xFF4268D3),
      ),
    ));
  }
}
