import 'package:flutter/material.dart';
import 'package:neoxero_task/widgets/video_card.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = '/details-screen';

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _launchUrl = 'https://www.youtube.com/watch?v=zxEEkm_qKjI';

  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      return 'cant launch $url';
    }
  }

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Upcoming Movies'),
          ),
          body: Column(
            children: <Widget>[
              VideoCard(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    color: Colors.grey,
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 12, right: 16, left: 16),
                      child: Row(
                        children: <Widget>[
                          Text('  Favorite  '),
                          Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    color: Colors.grey,
                    onPressed: () {
                      launchInBrowser(_launchUrl);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 12, right: 10, left: 10),
                      child: Row(
                        children: <Widget>[
                          Text('Watch Movie'),
                          Icon(Icons.play_arrow)
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
