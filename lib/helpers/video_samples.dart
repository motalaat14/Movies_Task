import 'package:flutter/material.dart';

class Video {
  final String id;
  final String videoUrl;

  const Video({
    @required this.id,
    @required this.videoUrl,
  });
}

const DUMMY_VIDEOS = const [
  Video(id: 'v1',videoUrl:'mmmmmmm'),
  Video(id: 'v1',videoUrl:'mmmmmmm'),
  Video(id: 'v1',videoUrl:'mmmmmmm'),
  Video(id: 'v1',videoUrl:'mmmmmmm'),
];
