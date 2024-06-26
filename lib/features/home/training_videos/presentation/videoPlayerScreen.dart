import 'package:car_trainer_application/features/home/training_videos/presentation/functions.dart';
import 'package:car_trainer_application/features/home/training_videos/presentation/globals.dart';
import 'package:car_trainer_application/features/home/training_videos/presentation/widgets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen1 extends StatefulWidget {
  const VideoPlayerScreen1({super.key});

  @override
  State<VideoPlayerScreen1> createState() => _VideoPlayerScreen1State();
}

class _VideoPlayerScreen1State extends State<VideoPlayerScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //!  Top - Video Player

            ValueListenableBuilder(
              valueListenable: videoFuture,
              builder: (context, value, child) {
                return AspectRatio(
                    aspectRatio: 16 / 9,
                    child: value == null
                        ? const BlankScreen()
                        : FutureBuilder(
                            future: value,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return VideoPlayer(videoPlayerController);
                              } else {
                                return const LoadingWidget();
                              }
                            },
                          ));
              },
            ),

            //!  Bottom - ListView

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: videos.length,

                itemBuilder: (context, index) => ListTile(
                  title: Text('Video ${index + 1}'),
                  subtitle: Text(videos[index]),
                  onTap: () => videoFuture.value = play(videos[index]),
                ),
// ...
              ),
            ),
          ],
        ),
      ),
    );
  }
}
