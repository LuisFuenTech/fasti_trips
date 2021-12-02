import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/User/model/user.model.dart';
import 'package:travel_platzi/widgets/background.widget.dart';

import '../widgets/place_list.widget.dart';
import '../widgets/profile_app_bar.dart';

class Profile extends StatelessWidget {
  late UserBloc userBloc;

  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.userStatusStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(backgroundColor: Colors.cyan),
              );
            default:
              return showProfileData(snapshot);
          }
        });
    /*Stack(
      children: [
        Background(),
        ListView(
          children: [ProfileAppBar(), PlacesList()],
        )
      ],
    );*/
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: [
          const Background(),
          ListView(
            children: const [Text("User not autenticated")],
          )
        ],
      );
    } else {
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL,
          places: [],
          favoritePlaces: []);
      return Stack(
        children: [
          //GradientBack(height: 330.0),

          const Background(
            height: 0.40,
          ),

          ListView(
            children: [
              ProfileAppBar(
                user: user,
              ),
              PlacesList(user: user)
            ],
          ),
        ],
      );
    }
  }

  /*void notificationListener() {
    FirebaseService.notificationStream.listen((message) {
      print("App: ---> $message");

      //navigatorKey.currentState?.pushNamed('message', arguments: message);
    });
  }*/
}
