import 'package:flutter/material.dart';
import 'package:neoxero_task/widgets/video_card.dart';

class FavoriteMovies extends StatefulWidget {
  
  
  @override
  _FavoriteMoviesState createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        VideoCard(),
        VideoCard(),
      ],
    );
  }
}
