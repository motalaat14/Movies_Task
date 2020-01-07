import 'package:flutter/material.dart';
import 'package:neoxero_task/taps/favorite_movies.dart';
import 'package:neoxero_task/taps/popular_movies.dart';
import 'package:neoxero_task/taps/upcoming_movies.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _tabcontroller;
  @override
  void initState() {
    super.initState();
    _tabcontroller=TabController(length: 3, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TASK'),
        centerTitle: true,

        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs:[
            Tab(text:'Upcoming'),
            Tab(text:'Favorite'),
            Tab(text:'Popular'),
          ],
          controller: _tabcontroller,
        ),
      ),

        body: Center(
            child:
            TabBarView(children: <Widget>[
              UpcomingMovies(),
              FavoriteMovies(),
              PopularMovies(),
            ],controller: _tabcontroller,)
        ),


    );
  }
}
