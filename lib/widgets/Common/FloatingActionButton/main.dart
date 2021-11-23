import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  const FloatingActionButtonGreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  bool isFavorited = false;

  void onPressedFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: isFavorited
          ? const Text("Added to Favorites")
          : const Text("Removed from Favorites"),
      duration: const Duration(milliseconds: 1500),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFavorite,
      child: Icon(
        isFavorited ? Icons.favorite : Icons.favorite_border,
        color: Colors.white,
      ),
    );
  }
}
