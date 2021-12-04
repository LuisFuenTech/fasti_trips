import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_platzi/Place/ui/screens/add_place.screen.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/widgets/circle_button.widget.dart';

class ProfileButtonsBar extends StatelessWidget {
  late UserBloc userBloc;

  ProfileButtonsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
      child: Row(
        children: [
          CircleButton(true, Icons.settings, 20.0,
              const Color.fromRGBO(255, 255, 255, 0.6), () => {}),
          CircleButton(
              false, Icons.add, 40.0, const Color.fromRGBO(255, 255, 255, 1),
              () {
            //File image = File("");

            ImagePicker()
                .pickImage(
                    source: ImageSource.camera, maxHeight: 2048, maxWidth: 1920)
                .then((image) async {
              if (image != null) {
                final message = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddPlaceScreen(
                              image: File(image.path),
                            )));

                if (message != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Error: $message"),
                    duration: const Duration(milliseconds: 2000),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Photo saved successfully"),
                    duration: Duration(milliseconds: 2000),
                  ));
                }
              }
            }).catchError((onError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Error: $onError"),
                duration: const Duration(milliseconds: 5000),
              ));
            });
          }),
          CircleButton(true, Icons.exit_to_app, 20.0,
              const Color.fromRGBO(255, 255, 255, 0.6), () async {
            await userBloc.signOut();
          }),
        ],
      ),
    );
  }
}
