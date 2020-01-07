import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulWidget {
  @override
  VideoCardState createState() => VideoCardState();
}

class VideoCardState extends State<VideoCard> {
  
  VideoPlayerController _controller;
  String videoUrl = 'https://r2---sn-4g5ednse.googlevideo.com/videoplayback?expire=1578413686&ei=FloUXrvcIIyM1AasmJagDw&ip=118.99.73.107&id=o-AIMygpT1nzqzxSRqMt_cYf1LMXRcBaZLbDfCzjbtDoAy&itag=18&source=youtube&requiressl=yes&vprv=1&mime=video%2Fmp4&gir=yes&clen=1680421&ratebypass=yes&dur=18.622&lmt=1444043204045136&fvip=2&fexp=23842630&c=WEB&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=ALgxI2wwRgIhAPSRD0_8lBBBPvkNXAVND92_WbBjvXOGkyPf8eol8g_iAiEAyi8m3kO1rNlJUu9hq0UFX7R6T7O6T6eYisRlIfiJnqA%3D&video_id=zxEEkm_qKjI&title=Nature+Beautiful+short+video+720p+HD&rm=sn-cp1oxu-jb3l7l&req_id=71a161ae9c60a3ee&redirect_counter=2&cm2rm=sn-npos77l&cms_redirect=yes&mip=156.198.201.219&mm=34&mn=sn-4g5ednse&ms=ltu&mt=1578392006&mv=m&mvi=1&pl=18&lsparams=mip,mm,mn,ms,mv,mvi,pl&lsig=AHylml4wRAIgSePiCuGCk8sfN-HSwSqJoMk0vkSF2JJshN3snvuqew8CIDoTyFu4g3hpyr8aFXBerarrssT98kzSUDAnUGvaQnh_';
  Future<void> _intializeVideoPlayerFuture;


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
            IconButton(
              icon: Icon(_controller.value.isPlaying ? Icons.play_arrow : Icons.pause),
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying ? _controller.pause() : _controller.play();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
