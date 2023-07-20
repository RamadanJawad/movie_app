import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/core/cache/cache.dart';
import 'package:movie_app/core/extensions/extensions.dart';
import 'package:movie_app/core/resources/manager_colors.dart';
import 'package:movie_app/core/resources/manager_fonts.dart';
import 'package:movie_app/core/resources/manager_size_util.dart';
import 'package:movie_app/core/resources/manager_strings.dart';
import 'package:movie_app/core/resources/manager_styles.dart';
import 'package:movie_app/features/movie/presentation/controller/movie_detalis_controller.dart';
import 'package:movie_app/features/movie/presentation/view/widget/custom_shimmer.dart';
import 'package:movie_app/routes/routes.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Get.delete<MovieDetailsController>(),
      child: Scaffold(
        body: GetBuilder<MovieDetailsController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: controller.isLoading
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              foregroundDecoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    Theme.of(context).primaryColor,
                                  ],
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${Constants.imageBasic}${controller.posterPath}',
                                width: double.infinity,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: ListTile(
                                title: Text(
                                  controller.title,
                                  style: getMediumTextStyle(
                                      fontSize: ManagerFontSize.s16,
                                      color: ManagerColors.white),
                                ),
                                subtitle: Text(
                                  controller.releaseDate,
                                  style: getMediumTextStyle(
                                      fontSize: ManagerFontSize.s14,
                                      color: Colors.grey),
                                ),
                                trailing: Text(
                                  controller.voteAverage
                                      .convertToPercentageString(),
                                  style: getMediumTextStyle(
                                      fontSize: ManagerFontSize.s16,
                                      color: ManagerColors.white),
                                ),
                              ),
                            ),
                            Positioned(
                              left: ManagerWidth.w10,
                              right: ManagerWidth.w10,
                              top: ManagerHeight.h30,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.delete<MovieDetailsController>();
                                      Get.back();
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.chevron_left,
                                      color: ManagerColors.white,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(CupertinoIcons.heart,
                                          color: ManagerColors.white)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ManagerWidth.w12,
                              vertical: ManagerHeight.h6),
                          child: Text(
                            controller.overview,
                            textAlign: TextAlign.justify,
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s12,
                                color: ManagerColors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ManagerWidth.w12,
                              vertical: ManagerHeight.h6),
                          child: Text(
                            ManagerStrings.cast,
                            textAlign: TextAlign.justify,
                            style: getBoldTextStyle(
                                fontSize: ManagerFontSize.s18,
                                color: ManagerColors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: ManagerHeight.h6,
                          ),
                          height: ManagerHeight.h160,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: ManagerHeight.h100,
                                width: ManagerWidth.w140,
                                child: Card(
                                  elevation: 1,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: ManagerWidth.w8,
                                    vertical: ManagerHeight.h4,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(ManagerRadius.r10),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(
                                                ManagerRadius.r10),
                                          ),
                                          child: CachedNetworkImage(
                                            height: ManagerHeight.h100,
                                            width: ManagerWidth.w140,
                                            imageUrl:
                                                '${Constants.imageBasic}${controller.data[index].profilePath}',
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: ManagerWidth.w8,
                                        ),
                                        child: Text(
                                          controller.data[index].name!,
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: ManagerWidth.w8,
                                          right: ManagerWidth.w8,
                                          bottom: ManagerHeight.h2,
                                        ),
                                        child: Text(
                                          controller.data[index].character!,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: ManagerHeight.h70,
                          margin: EdgeInsets.symmetric(
                              horizontal: ManagerWidth.w16),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  ManagerColors.royalBlue,
                                  ManagerColors.violet
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(ManagerRadius.r20),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w16),
                            margin: EdgeInsets.symmetric(
                                vertical: ManagerHeight.h10),
                            height: ManagerHeight.h16,
                            child: TextButton(
                              onPressed: () {
                                CacheData cacheData = CacheData();
                                cacheData
                                    .setMovieDetails(controller.video_response);
                                Get.toNamed(
                                  Routes.watchVideo,
                                  arguments: controller.video_response,
                                );
                              },
                              child: Text(
                                "Watch Trailer",
                                style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s16,
                                    color: ManagerColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : getShimmerDetailsLoading(),
            );
          },
        ),
      ),
    );
  }
}
