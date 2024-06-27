
import 'package:car_trainer_application/features/home/training_videos/presentation/globals.dart';
import 'package:video_player/video_player.dart';

Future<void> play(String url) async {
  if (url.isEmpty) return;
  if (videoPlayerController.value.isInitialized) {
    await videoPlayerController.dispose();
  }
  videoPlayerController = VideoPlayerController.network(url);
  return videoPlayerController
      .initialize()
      .then((value) => videoPlayerController.play());
}