import 'package:flutter/material.dart';

import '../widgets/place_app_bar.widget.dart';
import '../widgets/place_info.widget.dart';
import '../widgets/review_place_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String descriptionText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sapien massa, elementum sit amet vestibulum quis, accumsan sagittis justo. Nunc in pretium dui, id semper ligula. Integer accumsan at lorem in congue. Suspendisse et ipsum odio. Maecenas suscipit, ex ac blandit malesuada, arcu justo convallis felis, ac tincidunt est dolor in elit. Etiam malesuada libero nec congue porttitor. Maecenas gravida neque nibh, ut pretium erat cursus eget.";

    return Stack(
      children: [
        ListView(children: [
          PlaceInfo("Cartagena", 4.5, descriptionText),
          const ReviewList()
        ]),
        HeaderAppBar()
      ],
    );
  }
}
