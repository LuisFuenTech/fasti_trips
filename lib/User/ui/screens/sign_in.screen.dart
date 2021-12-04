import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/User/model/user.model.dart' as user_model;
import 'package:travel_platzi/platzi_trips.dart';
import 'package:travel_platzi/services/firebase.service.dart';
import 'package:travel_platzi/widgets/button_green.widget.dart';
import 'package:travel_platzi/widgets/gradient_back.widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late UserBloc userBloc;
  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    screenWidth = MediaQuery.of(context).size.width;

    return handleCurrentSession();
  }

  Widget handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.userStatusStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          /*if (snapshot.hasData && snapshot.connectionState = ) {
            return const PlatziTrips();
          }

          if (snapshot.hasError ||
              snapshot.connectionState != ConnectionState.waiting) {
            return signInGoogleUI();
          }*/

          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              if (snapshot.hasError) {
                return signInGoogleUI();
              } else {
                return loadingWidget();
              }
            default:
              if (snapshot.hasData) {
                return const PlatziTrips();
              } else {
                return signInGoogleUI();
              }
          }
        });
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(height: null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Container(
                width: screenWidth,
                margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: const Text(
                  "Welcome \n This is your travel App",
                  style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
              ButtonGreen(
                text: 'Sign in with Google',
                onPressed: () async {
                  await userBloc.signOut();
                  User? user = await userBloc.signIn();

                  if (user != null) {
                    String? deviceToken =
                        await FirebaseService.getDeviceToken();

                    userBloc.updateUserData(user_model.User(
                        uid: user.uid,
                        name: user.displayName as String,
                        email: user.email as String,
                        photoURL: user.photoURL as String,
                        places: [],
                        favoritePlaces: [],
                        deviceToken: deviceToken as String));
                  }
                },
                width: 250.0,
                height: 55.0,
                icon: const Icon(
                  Icons.android,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget loadingWidget() {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const CircularProgressIndicator(
          backgroundColor: Colors.cyan,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: const Text("L o a d i n g...",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  fontFamily: "Lato",
                  decoration: TextDecoration.none)),
        )
      ]),
    );
  }
}
