import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

List<String> videos = [
  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
];

VideoPlayerController videoPlayerController = VideoPlayerController.network('');
ValueNotifier<Future<void>?> videoFuture = ValueNotifier(null);
