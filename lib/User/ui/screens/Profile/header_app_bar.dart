import 'package:flutter/material.dart';

import 'user_info.dart';
import 'buttons_bar.dart';

class HeaderAppBar extends StatelessWidget{
  String titleHeader;

  HeaderAppBar(this.titleHeader, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = Text(
      titleHeader,
      style: const TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0
      ),
    );

    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 50.0
      ),
      child: Column(
        children: [
          Row(
            children: [
              title,
            ],
          ),
          UserInfo("assets/images/profile-1.jpg", "Luis Fuentes", "luisfuentes.au@gmail.com"),
          ButtonsBar()
        ],
      ),
    );
  }
  
}