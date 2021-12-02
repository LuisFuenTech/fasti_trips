import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/User/model/user.model.dart';
import 'package:travel_platzi/widgets/background.widget.dart';
import 'package:travel_platzi/widgets/card_image_list.widget.dart';

class HeaderAppBar extends StatelessWidget {
  late UserBloc _userBloc;

  HeaderAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: _userBloc.userStatusStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.cyan,
                ),
              );
            default:
              return showPlacesData(snapshot);
          }
        });
  }

  Widget showPlacesData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: const [
          Background(height: 0.45),
          Text("User not logged. Please sign in")
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
          const Background(
            height: 0.35,
          ),
          CardImageList(user: user)
        ],
      );
    }
  }
}
