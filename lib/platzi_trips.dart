import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/User/ui/screens/profile.screen.dart';

import 'Place/ui/screens/home.screen.dart';
import 'Place/ui/screens/search.screen.dart';

class PlatziTrips extends StatefulWidget {
  const PlatziTrips({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PlatziTrips();
  }
}

class _PlatziTrips extends State<PlatziTrips> {
  final Map<String, int> bottomNavMap = {"home": 0, "search": 1, "profile": 2};
  late int indexTap = 0;

  final List<Widget> widgetChildren = [
    Builder(
      builder: (BuildContext context) {
        return BlocProvider<UserBloc>(
          bloc: UserBloc(),
          child: const HomePage(),
        );
      },
    ),
    const Search(),
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
    Map castArguments(Object? args) {
      if (args != null) {
        return args as Map;
      } else {
        return {};
      }
    }

    final Map arguments =
        castArguments(ModalRoute.of(context)?.settings.arguments); // as Map;

    print(arguments["destination"]);
    indexTap = bottomNavMap[arguments["destination"]] ?? indexTap;

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
