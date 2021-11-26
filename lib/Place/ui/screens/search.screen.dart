import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Container(
          height: 50.0,
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child: const Center(
            child: Text(
              "Search",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
