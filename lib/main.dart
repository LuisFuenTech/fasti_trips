import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/User/ui/screens/sign_in.screen.dart';
import 'package:travel_platzi/services/firebase.service.dart';

Future<void> main() async {
  print("Main");
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeApp();
  await FirebaseService.initializeNotificationApp();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    //Context here!
    super.initState();

    FirebaseService.notificationStream.listen((message) {
      print("App: ---> $message");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Fasti Trips",
          home: FutureBuilder(
            future: FirebaseService.initializeApp(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong!");
              } else if (snapshot.hasData) {
                return const SignInScreen(); //PlatziTrips();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
