import 'package:flutter/material.dart';
import 'package:travel_platzi/Place/model/place.model.dart';
import 'package:travel_platzi/User/model/user.model.dart';
import 'package:travel_platzi/User/ui/widgets/profile_buttons_bar.widget.dart';
import 'package:travel_platzi/User/ui/widgets/user_info.widget.dart';

class ProfileAppBar extends StatelessWidget {
  late User user;
  late User defaultuser;

  ProfileAppBar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          UserInfo(user: user),
          ProfileButtonsBar()
        ],
      ),
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    const title = Text(
      "Profile",
      style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0),
    );

    List<Place> places = [
      Place(
        name: "",
        description: "",
        photoURL: "",
        likes: 123,
      )
    ];

    if (!snapshot.hasData || snapshot.hasError) {
      defaultuser = User(
          places: places,
          favoritePlaces: places,
          uid: "",
          name: "",
          email: "",
          photoURL:
              "https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_92x30dp.png");

      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: [
            Row(
              children: const [
                title,
              ],
            ),
            //const CircularProgressIndicator(),
            UserInfo(user: defaultuser),
            ProfileButtonsBar()
          ],
        ),
      );
    } else {
      user = User(
          places: places,
          favoritePlaces: places,
          uid: "151656565",
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);

      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: [
            Row(
              children: const [
                title,
              ],
            ),
            UserInfo(user: user),
            ProfileButtonsBar()
          ],
        ),
      );
    }
  }
}
