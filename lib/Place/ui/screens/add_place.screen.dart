import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:travel_platzi/Place/model/place.model.dart';
import 'package:travel_platzi/Place/ui/widgets/input_location.widget.dart';
import 'package:travel_platzi/User/bloc/user.bloc.dart';
import 'package:travel_platzi/widgets/background.widget.dart';
import 'package:travel_platzi/widgets/button.widget.dart';
import 'package:travel_platzi/widgets/card_image_fab_icon.widget.dart';
import 'package:travel_platzi/widgets/text_input.widget.dart';
import 'package:travel_platzi/widgets/title_header.widget.dart';

class AddPlaceScreen extends StatefulWidget {
  final File image;

  const AddPlaceScreen({Key? key, required this.image}) : super(key: key);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final controllerTitlePlace = TextEditingController();
    final controllerDescriptionPlace = TextEditingController();
    final controllerAddPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          const Background(
            height: 0.45,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 45.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                  child: Container(
                padding:
                    const EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                child: const TitleHeader(title: "Add a new Place"),
              )),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  alignment: Alignment.center,
                  child: CardImageFabIcon(
                    pathImage: widget.image.path, //widget.image.path,
                    iconData: Icons.camera_alt,
                    height: 250.0,
                    width: 350.0,
                    left: 0.0,
                    onPressedFanIcon: () {},
                    internet: false,
                  ),
                ), //Photo
                Container(
                  //TextField title
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    maxLines: 1,
                    controller: controllerTitlePlace,
                  ),
                ),
                TextInput(
                  hintText: "Description",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: controllerDescriptionPlace,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "Add location",
                    iconData: Icons.location_on_outlined,
                    controller: controllerAddPlace,
                  ),
                ),
                SizedBox(
                  width: 70.0,
                  child: Button(
                    buttonText: "Add place",
                    onPressed: () async {
                      User? user = userBloc.currentUser;

                      if (user != null) {
                        String path =
                            "${user.uid}/${DateTime.now().toString()}.jpg"
                                .replaceAll(RegExp(r"\s+"), "_");
                        //Firestore Storage
                        TaskSnapshot taskSnapshot =
                            await userBloc.uploadFile(path, widget.image);

                        //Firestore DB
                        await userBloc.updatePlaceData(Place(
                          name: controllerTitlePlace.text,
                          description: controllerDescriptionPlace.text,
                          likes: 0,
                          photoURL: await taskSnapshot.ref.getDownloadURL(),
                          userOwner: user.uid,
                        ));

                        /*await FilesHelper().saveFile(
                            file: widget.image,
                            type: 'image',
                            fileName: 'my-place.jpg');*/

                        Navigator.pop(context);
                      } else {
                        Navigator.pop(
                            context, const Text("User not available"));
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
