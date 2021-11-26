import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/Place/ui/screens/add_place.screen.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/widgets/circle_button.widget.dart';

class ProfileButtonsBar extends StatelessWidget {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
      child: Row(
        children: [
          CircleButton(true, Icons.vpn_key, 20.0,
              const Color.fromRGBO(255, 255, 255, 0.6), () => {}),
          CircleButton(
              false, Icons.add, 40.0, const Color.fromRGBO(255, 255, 255, 1),
              () {
            File image = File("");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddPlaceScreen(
                          image: image,
                        )));
          }),
          CircleButton(true, Icons.exit_to_app, 20.0,
              const Color.fromRGBO(255, 255, 255, 0.6), () {
            userBloc.signOut();
          }),
        ],
      ),
    );
  }
}
