import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/core/cache/cache.dart';
import 'package:movie_app/core/resources/manager_assets.dart';
import 'package:movie_app/core/resources/manager_size_util.dart';
import 'package:movie_app/core/resources/manager_strings.dart';
import 'package:movie_app/features/home/presentation/controller/home_controller.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_app_bar.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_text.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_navigaton_bar.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_shimmer.dart';
import 'package:movie_app/features/home/presentation/view/widget/shimmer_listView.dart';
import 'package:movie_app/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomNavigationBar(),
      body: SafeArea(
        child: GetBuilder<HomeController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.isLoading
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: ManagerHeight.h340,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(ManagerWidth.w40),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  CachedNetworkImage(
                                    imageUrl:
                                        '${Constants.imageBasic}${controller.imagePath}',
                                    width: double.infinity,
                                    height: ManagerHeight.h220,
                                    fit: BoxFit.fill,
                                  ),
                                  BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 5.0, sigmaY: 5.0),
                                    child: Container(
                                      width: ManagerWidth.w100,
                                      height: ManagerHeight.h1,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  const CustomAppBar(),
                                ],
                              ),
                            ),
                          ),
                          CarouselSlider(
                            carouselController: controller.carouselController,
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              viewportFraction: 0.5,
                              autoPlay: true,
                              height: ManagerHeight.h205,
                              onPageChanged: (index, reason) {
                                controller.onPageChange(index);
                              },
                            ),
                            items: controller.results
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      CacheData cacheData = CacheData();
                                      cacheData.setMovieId(e.id!);
                                      Get.toNamed(Routes.movieDetails);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            ManagerRadius.r14),
                                        image: DecorationImage(
                                            image: e.posterPath!.isNotEmpty
                                                ? NetworkImage(
                                                    "${Constants.imageBasic}${e.posterPath!.toString()}")
                                                : const AssetImage(
                                                        ManagerAssets.logo)
                                                    as ImageProvider,
                                            fit: BoxFit.fitWidth),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      )
                    : const CustomShimmer(),
                controller.isLoading
                    ? Column(
                        children: [
                          CustomText(
                            title: ManagerStrings.popular,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w10,
                                vertical: ManagerHeight.h14),
                            height: ManagerHeight.h160,
                            child: ListView.builder(
                              itemCount: controller.popularData.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    CacheData cacheData = CacheData();
                                    cacheData.setMovieId(
                                        controller.popularData[index].id!);
                                    Get.toNamed(Routes.movieDetails);
                                  },
                                  child: Container(
                                    width: ManagerWidth.w100,
                                    height: ManagerHeight.h130,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: ManagerWidth.w6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          ManagerRadius.r10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${Constants.imageBasic}${controller.popularData[index].posterPath!.toString()}"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : getShimmerLoading(),
                controller.isLoading
                    ? Column(
                        children: [
                          CustomText(
                            title: ManagerStrings.topRated,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w10,
                                vertical: ManagerHeight.h14),
                            height: ManagerHeight.h160,
                            child: ListView.builder(
                                itemCount: controller.topRatedData.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      CacheData cacheData = CacheData();
                                      cacheData.setMovieId(
                                          controller.topRatedData[index].id!);
                                      Get.toNamed(Routes.movieDetails);
                                    },
                                    child: Container(
                                      width: ManagerWidth.w100,
                                      height: ManagerHeight.h130,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: ManagerWidth.w6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            ManagerRadius.r10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${Constants.imageBasic}${controller.topRatedData[index].posterPath!.toString()}"),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      )
                    : getShimmerLoading(),
                controller.isLoading
                    ? Column(
                        children: [
                          CustomText(
                            title: ManagerStrings.nowPlaying,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w10,
                                vertical: ManagerHeight.h14),
                            height: ManagerHeight.h160,
                            child: ListView.builder(
                                itemCount: controller.nowPlayingData.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      CacheData cacheData = CacheData();
                                      cacheData.setMovieId(
                                          controller.nowPlayingData[index].id!);
                                      Get.toNamed(Routes.movieDetails);
                                    },
                                    child: Container(
                                      width: ManagerWidth.w100,
                                      height: ManagerHeight.h130,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: ManagerWidth.w6),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              ManagerRadius.r10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${Constants.imageBasic}${controller.nowPlayingData[index].posterPath!.toString()}"),
                                              fit: BoxFit.cover)),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      )
                    : getShimmerLoading(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
