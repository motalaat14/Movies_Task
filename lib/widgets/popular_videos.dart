import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class PopularVideo extends StatefulWidget {
  @override
  PopularVideoState createState() => PopularVideoState();
}

class PopularVideoState extends State<PopularVideo> {

  VideoPlayerController _controller;
  String videoUrl = 'https://r5---sn-hgn7rn7k.googlevideo.com/videoplayback?expire=1578404461&ei=DTYUXuf_IMSMoQPtub3QDQ&ip=125.24.174.119&id=o-ANf0BY3dNpNXej1pJlLZc-TZ9OEFk3Ahk1yfOAnOLDEa&itag=18&source=youtube&requiressl=yes&vprv=1&mime=video%2Fmp4&gir=yes&clen=439440&ratebypass=yes&dur=10.077&lmt=1432094039538727&fvip=5&fexp=23842630,23860863&c=WEB&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=ALgxI2wwRQIhAM8n1y9HVGqtqp0frUaQFTUHUgx5ikv7w99v0LaMJcQDAiB_ZdJ9j9vTTdazWfRZdTRi9fOe_j_Bh9ZNeQ-yn3f6Bw%3D%3D&video_id=lTTajzrSkCw&title=Funny+rubbit%27s+10+sec+video&rm=sn-uvu-c33ee7s,sn-uvu-c33676,sn-30aer76&req_id=b3808e55b2e3a3ee&redirect_counter=3&cms_redirect=yes&ipbypass=yes&mip=156.198.201.219&mm=30&mn=sn-hgn7rn7k&ms=nxu&mt=1578392121&mv=m&mvi=4&pl=18&lsparams=ipbypass,mip,mm,mn,ms,mv,mvi,pl&lsig=AHylml4wRQIgbWVKq9XJcyFy7nNEo6yTX9XasY-pQC0AbcJvXktGDwICIQCtV_L6_mK2U881pGu7oW-3zFTNR1zonPORLmgigSf6ZQ==';
  Future<void> _intializeVideoPlayerFuture;



  String _launchUrl = 'https://www.youtube.com/watch?v=lTTajzrSkCw';
  Future<void> launchInBrowser(String url) async {
//    if (await canLaunch(url)) {
      await launch(url);
//    } else {
//      return 'cant launch $url';
//    }
  }


  @override
  void initState() {
    _controller = VideoPlayerController.network(videoUrl);
    _intializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: _intializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(_controller.value.isPlaying ? Icons.play_arrow : Icons.pause),
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying ? _controller.pause() : _controller.play();
                    });
                  },
                ),
                FlatButton(
//                  color: Colors.grey,
                  onPressed: () {
                    launchInBrowser(_launchUrl);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, right: 10, left: 10),
                    child: Row(
                      children: <Widget>[
                        Text('youtube'),
                        Icon(Icons.play_arrow)
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
