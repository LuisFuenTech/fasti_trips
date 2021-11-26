import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/User/ui/screens/sign_in.screen.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final Future<FirebaseApp> firebaseApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
          title: 'Flutter Demo',
          home: FutureBuilder(
            future: firebaseApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print("You have an error! ${snapshot.error.toString()}");
                return const Text("Something went wrong!");
              } else if (snapshot.hasData) {
                return const SignInScreen(); //PlatziTrips();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
          //const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
    );
  }
}
