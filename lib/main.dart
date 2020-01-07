import 'package:flutter/material.dart';
import 'package:neoxero_task/screens/details_screen.dart';

import 'package:neoxero_task/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),

      routes: {
        DetailsScreen.routeName: (ctx) => DetailsScreen(),
      },

    );
  }
}

