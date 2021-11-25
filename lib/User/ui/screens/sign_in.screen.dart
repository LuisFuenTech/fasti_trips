import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return handleCurrentSession();
  }

  Widget handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 40.0, left: 40.0),
                child: const Text(
                  "Welcome \n This is your travel App",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ButtonGreen(
                text: 'Login with Gmail',
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn();
                  //userBloc.signIn().then((user) => print(user.toString()));
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
