import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulWidget {
  @override
  VideoCardState createState() => VideoCardState();
}

class VideoCardState extends State<VideoCard> {
  
  VideoPlayerController _controller;
  String videoUrl = 'http://www.html5videoplayer.net/videos/toystory.mp4';
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
