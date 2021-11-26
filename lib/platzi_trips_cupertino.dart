import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Place/ui/screens/home.screen.dart';
import 'Place/ui/screens/search.screen.dart';
import 'User/ui/screens/profile.screen.dart';

class PlatziCupertino extends StatelessWidget {
  final List<Widget> widgetChildren = [HomePage(), Search(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.indigo),
              activeIcon: Icon(Icons.home, color: Colors.lightBlue)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.indigo),
              activeIcon: Icon(Icons.search, color: Colors.lightBlue)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.indigo),
              activeIcon: Icon(Icons.person, color: Colors.lightBlue)),
        ]),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) => widgetChildren[index],
          );
        },
      ),
    );
  }
}
