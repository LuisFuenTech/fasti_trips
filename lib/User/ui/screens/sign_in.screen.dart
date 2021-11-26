import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/User/model/user.model.dart' as user_model;
import 'package:travel_platzi/platzi_trips.dart';
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
        stream: userBloc.userStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(
              "snapshot.connectionState=${snapshot.connectionState} hasData=${snapshot.hasData} hasError=${snapshot.hasError}");
          print("data -> ${snapshot.toString()}");
          if (snapshot.hasData) {
            return PlatziTrips();
          }

          if (snapshot.hasError ||
              snapshot.connectionState != ConnectionState.waiting) {
            return signInGoogleUI();
          }

          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.cyan[400],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text("L o a d i n g...",
                    style: TextStyle(
                        color: Colors.blue[400],
                        fontSize: 22,
                        fontFamily: "Lato",
                        decoration: TextDecoration.none)),
              )
            ]),
          );
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
                text: 'Login with Gmail',
                onPressed: () {
                  userBloc.signIn().then((user) {
                    userBloc.updateUserData(user_model.User(
                        uid: user!.uid,
                        name: user.displayName as String,
                        email: user.email as String,
                        photoURL: user.photoURL as String,
                        places: [],
                        favoritePlaces: []));
                  });
                },
                width: 300.0,
                height: 55.0,
                icon: const Icon(
                  Icons.add_reaction,
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
}
