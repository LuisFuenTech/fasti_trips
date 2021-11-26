import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/User/ui/screens/profile.screen.dart';

import 'Place/ui/screens/home.screen.dart';
import 'Place/ui/screens/search.screen.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlatziTrips();
  }
}

class _PlatziTrips extends State<PlatziTrips> {
  int indexTap = 0;
  final List<Widget> widgetChildren = [
    HomePage(),
    Search(),
    Builder(
      builder: (BuildContext context) {
        return BlocProvider<UserBloc>(
          bloc: UserBloc(),
          child: Profile(),
        );
      },
    )
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.indigo),
                label: "",
                activeIcon: Icon(Icons.home, color: Colors.lightBlue)),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.indigo),
                activeIcon: Icon(Icons.search, color: Colors.lightBlue),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.indigo),
                activeIcon: Icon(Icons.person, color: Colors.lightBlue),
                label: ""),
          ],
        ),
      ),
    );
  }
}
