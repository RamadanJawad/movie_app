import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/resources/manager_colors.dart';
import 'package:movie_app/core/resources/manager_fonts.dart';
import 'package:movie_app/core/resources/manager_size_util.dart';
import 'package:movie_app/core/resources/manager_styles.dart';
import 'package:movie_app/features/movie/presentation/controller/video_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideo extends StatelessWidget {
  final String? keyVideo;
  final String? nameVideo;
  const WatchVideo({super.key, this.keyVideo, this.nameVideo});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Get.delete<VideoController>(),
      child: Scaffold(
        body: GetBuilder<VideoController>(builder: (controller) {
          return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: controller.youtubeController!,
              aspectRatio: 16 / 9,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: const ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
            ),
            builder: (context, player) {
              return Column(
                children: [
                  player,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < controller.video.length; i++)
                            Container(
                              height: ManagerHeight.h60,
                              padding: EdgeInsets.symmetric(
                                  vertical: ManagerHeight.h8),
                              child: Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      controller.youtubeController!
                                          .load(controller.video[i].key);
                                      controller.youtubeController!.play();
                                    },
                                    child: CachedNetworkImage(
                                      width: ManagerWidth.w205,
                                      imageUrl: YoutubePlayer.getThumbnail(
                                        videoId: controller.video[i].key,
                                        quality: ThumbnailQuality.high,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: ManagerWidth.w8),
                                      child: Text(
                                        controller.video[i].name,
                                        maxLines: 2,
                                        style: getMediumTextStyle(
                                            fontSize: ManagerFontSize.s14,
                                            color: ManagerColors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
