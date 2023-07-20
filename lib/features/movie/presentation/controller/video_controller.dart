import 'package:get/get.dart';
import 'package:movie_app/core/cache/cache.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoController extends GetxController {
  var index = 0;
  YoutubePlayerController? youtubeController;
  CacheData cacheData = CacheData();
  List video = [];

  @override
  void onInit() {
    super.onInit();
    video = cacheData.getMovieDetails();
    youtubeController = YoutubePlayerController(
      initialVideoId: video[0].key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  void dispose() {
    youtubeController?.dispose();
    Get.delete<VideoController>();
    super.dispose();
  }
}
