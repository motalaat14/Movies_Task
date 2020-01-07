import 'package:flutter/material.dart';
import 'package:neoxero_task/widgets/popular_videos.dart';

class PopularMovies extends StatefulWidget {
  @override
  _PopularMoviesState createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PopularVideo()
      ],
    );
  }
}
