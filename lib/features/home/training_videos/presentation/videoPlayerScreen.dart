import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/home/training_videos/presentation/widgets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen1 extends StatefulWidget {
  const VideoPlayerScreen1({super.key});

  @override
  State<VideoPlayerScreen1> createState() => _VideoPlayerScreen1State();
}

class _VideoPlayerScreen1State extends State<VideoPlayerScreen1> {
  // ! --------------------------------------------------------
  VideoPlayerController videoPlayerController =
      VideoPlayerController.network('');
  ValueNotifier<Future<void>?> videoFuture = ValueNotifier(null);
  int? selectIndex;
  String formattedTime = '';

  @override
  void initState() {
    videoFuture.value = play(videos[0]);
    setState(() {
      selectIndex = 0;
    });
    super.initState();
  }

  List<String> videos = [
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
  ];

  final videoThumbnailUrl = [
    {
      'name': "Elephant Dream",
      'thumbnailUrl':
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
    },
    {
      'name': "Big Buck Bunny",
      'thumbnailUrl':
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
    },
    {
      'name': "For Bigger Blazes",
      'thumbnailUrl':
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg",
    },
    {
      'name': "For Bigger Escape",
      'thumbnailUrl':
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg"
    }
  ];

  Future<void> play(String url) async {
    if (url.isEmpty) return;
    if (videoPlayerController.value.isInitialized) {
      await videoPlayerController.dispose();
    }
    videoPlayerController = VideoPlayerController.network(url);
    await videoPlayerController.initialize();
    setState(() {});
    await videoPlayerController.play();
  }

  void togglePlayPause() {
    setState(() {
      if (videoPlayerController.value.isPlaying) {
        videoPlayerController.pause();
      } else {
        videoPlayerController.play();
      }
    });
  }

  void rewind() {
    final currentPosition = videoPlayerController.value.position;
    final rewindPosition = currentPosition - Duration(seconds: 10);
    videoPlayerController.seekTo(rewindPosition);
  }

  void forward() {
    final currentPosition = videoPlayerController.value.position;
    final forwardPosition = currentPosition + Duration(seconds: 10);
    videoPlayerController.seekTo(forwardPosition);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  // ! --------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    print(" Formatted Time - $formattedTime");

    formattedTime =
        '${videoPlayerController.value.position.inMinutes}:${(videoPlayerController.value.position.inSeconds % 60).toString().padLeft(2, '0')} / ${videoPlayerController.value.duration.inMinutes}:${(videoPlayerController.value.duration.inSeconds % 60).toString().padLeft(2, '0')}';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: const Icon(
            Icons.turn_left,
            size: 35,
            color: AppColors.darkColor,
          ),
          onTap: () {
            NavigationHelper.goBack(context);
          },
        ),
        title: const Text(
          "Training videos",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
              fontFamily: "Poppins"),
        ),
      ),
      body: Column(
        children: [
          //! Top - Video Player

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
                              return Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  VideoPlayer(videoPlayerController),
                                  Positioned(
                                    bottom: 5,
                                    left: 10,
                                    right: 10,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.replay_10,
                                                color: Colors.white,
                                              ),
                                              onPressed: rewind,
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                videoPlayerController
                                                        .value.isPlaying
                                                    ? Icons.pause
                                                    : Icons.play_arrow,
                                                color: Colors.white,
                                              ),
                                              onPressed: togglePlayPause,
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.forward_10,
                                                color: Colors.white,
                                              ),
                                              onPressed: forward,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              formattedTime,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        VideoProgressIndicator(
                                          colors: VideoProgressColors(
                                              playedColor:
                                                  AppColors.buttonColorNew,
                                              bufferedColor: Colors.white),
                                          videoPlayerController,
                                          allowScrubbing: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const LoadingWidget();
                            }
                          },
                        ));
            },
          ),

          //! Bottom - ListView

          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    color: index == selectIndex ? Colors.blue : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          leading: Image.network(videoThumbnailUrl[index]
                                  ['thumbnailUrl']
                              .toString()),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: ScreenDimension.screenWidth * 0.60,
                                child: Text(
                                  textAlign: TextAlign.start,
                                  videoThumbnailUrl[index]['name'].toString(),
                                  style: TextStyle(
                                      color: index == selectIndex
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14,
                                      fontFamily: "Poppins"),
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            videoFuture.value = play(videos[index]);
                            setState(() {
                              selectIndex = index;
                            });
                          }),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
