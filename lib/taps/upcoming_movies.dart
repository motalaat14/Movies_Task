import 'package:flutter/material.dart';
import 'package:neoxero_task/screens/details_screen.dart';
import 'package:neoxero_task/widgets/video_card.dart';

class UpcomingMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GestureDetector(child: Column(
          children: <Widget>[
            VideoCard(),
          ],
        ),
         onTap: () {
    Navigator.of(context).pushNamed(DetailsScreen.routeName);
    },
        ),

      ],
    );
  }
}

