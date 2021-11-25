import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/User/model/user.model.dart';
import 'package:travel_platzi/User/ui/widgets/profile_buttons_bar.widget.dart';
import 'package:travel_platzi/User/ui/widgets/user_info.widget.dart';

class ProfileAppBar extends StatelessWidget {
  late User userData;

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.userStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return const CircularProgressIndicator();
          case ConnectionState.active:
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
    );

    /*final title = Text(
      titleHeader,
      style: const TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0),
    );

    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      child: Column(
        children: [
          Row(
            children: [
              title,
            ],
          ),
          UserInfo("assets/images/profile-1.jpg", "Luis Fuentes",
              "luisfuentes.au@gmail.com"),
          ButtonsBar()
        ],
      ),
    );*/
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: const [
            CircularProgressIndicator(),
            Text("Info couldn't be loaded")
          ],
        ),
      );
      ;
    } else {
      userData = User(
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          imageURL: snapshot.data.photoURL);
      const title = Text(
        "Profile",
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );

      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: [
            Row(
              children: const [
                title,
              ],
            ),
            UserInfo(user: userData),
            ProfileButtonsBar()
          ],
        ),
      );
    }
  }
}
