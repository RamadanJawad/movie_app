import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/core/cache/cache.dart';
import 'package:movie_app/core/resources/manager_assets.dart';
import 'package:movie_app/core/resources/manager_colors.dart';
import 'package:movie_app/core/resources/manager_fonts.dart';
import 'package:movie_app/core/resources/manager_size_util.dart';
import 'package:movie_app/core/resources/manager_styles.dart';
import 'package:movie_app/features/search/presentation/controller/search_controller.dart';
import 'package:movie_app/routes/routes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Get.delete<SearchController>(),
      child: GetBuilder<SearchController>(builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(CupertinoIcons.chevron_left)),
            title: TextFormField(
              controller: controller.searchController,
              onChanged: (value) {
                controller.showResult(value);
              },
              style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.white),
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                hintText: 'search...',
                hintStyle: getRegularTextStyle(
                    fontSize: ManagerFontSize.s14, color: ManagerColors.white),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.searchController.clear();
                  },
                  icon: const Icon(
                    CupertinoIcons.clear,
                    color: ManagerColors.grey,
                  ),
                ),
              ),
            ),
          ),
          body: SizedBox(
            width: double.infinity,
            child: ListView.builder(
                itemCount: controller.searchResult.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      CacheData cacheData = CacheData();
                      cacheData.setMovieId(controller.searchResult[index].id!);
                      Get.toNamed(Routes.movieDetails);
                    },
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ManagerWidth.w12,
                          vertical: ManagerHeight.h2,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(ManagerWidth.w8),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(ManagerRadius.r4),
                                  child: controller
                                              .searchResult[index].posterPath ==
                                          null
                                      ? Image.asset(
                                          ManagerAssets.movie,
                                          fit: BoxFit.fill,
                                          width: ManagerWidth.w80,
                                          height: ManagerHeight.h110,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl:
                                              '${Constants.imageBasic}${controller.searchResult[index].posterPath}',
                                          width: ManagerWidth.w80,
                                        )),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.searchResult[index].title!,
                                    style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s14,
                                        color: ManagerColors.white),
                                  ),
                                  Text(
                                    controller.searchResult[index].overview ??
                                        '',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s12,
                                        color: ManagerColors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  );
                }),
          ),
        );
      }),
    );
  }
}
