import 'package:flutter/material.dart';

import '../../widgets/ReviewList/main.dart';
import '../../widgets/Place/main.dart';
import '../../widgets/HeaderAppBar/main.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sapien massa, elementum sit amet vestibulum quis, accumsan sagittis justo. Nunc in pretium dui, id semper ligula. Integer accumsan at lorem in congue. Suspendisse et ipsum odio. Maecenas suscipit, ex ac blandit malesuada, arcu justo convallis felis, ac tincidunt est dolor in elit. Etiam malesuada libero nec congue porttitor. Maecenas gravida neque nibh, ut pretium erat cursus eget.";

    return Stack(
      children: [
        ListView(
            children: [
              Place("Cartagena", 4.5, descriptionText),
              ReviewList()
            ]
        ),
        HeaderAppBar()
      ],
    );
  }
  
}