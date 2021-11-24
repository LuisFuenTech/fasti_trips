//import 'dart:math';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  const FloatingActionButtonGreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  bool isFavorite = false;
  //CollectionReference favorites = FirebaseFirestore.instance.collection("favorites");
  //final DatabaseReference _favorites = FirebaseDatabase.instance.reference().child("test");

  void onPressedFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    //favorites.add({"isFavorite": isFavorite, "data": Random().nextInt(100)});
    //_favorites.set("hello world ${Random().nextInt(100)}");

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: isFavorite
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
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.white,
      ),
    );
  }
}
