import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/config/dependency_injection.dart';
import 'package:movie_app/features/home/domain/model/results.dart';
import 'package:movie_app/features/home/domain/usecase/home_usecase.dart';
import 'package:movie_app/features/home/domain/usecase/now_playing_usecase.dart';
import 'package:movie_app/features/home/domain/usecase/popular_usecase.dart';
import 'package:movie_app/features/home/domain/usecase/top_rated_usecase.dart';

class HomeController extends GetxController {
  final HomeUseCase _useCase = instance<HomeUseCase>();
  final PopularUseCase _popularUseCase = instance<PopularUseCase>();
  final TopRatedUseCase _topRatedUseCase = instance<TopRatedUseCase>();
  final NowPlayingUseCase _nowPlayingUseCase = instance<NowPlayingUseCase>();
  late CarouselController carouselController;
  List<Results> results = [];
  List<Results> popularData = [];
  List<Results> topRatedData = [];
  List<Results> nowPlayingData = [];
  List<Results>? homeSlider;
  int initialPage = 0;
  String imagePath = '';
  late PageController pageController;
  bool isLoading = false;

  Future<void> home() async {
    (await _useCase.execute()).fold(
      (l) {},
      (r) {
        results = r.results!;
        homeSlider = r.results!;
        isLoading = true;
        update();
      },
    );
  }

  Future<void> popular() async {
    (await _popularUseCase.execute()).fold(
      (l) {},
      (r) {
        popularData = r.results!;
        isLoading = true;
        update();
      },
    );
  }

  Future<void> topRated() async {
    (await _topRatedUseCase.execute()).fold(
      (l) {},
      (r) {
        topRatedData = r.results!;
        isLoading = true;
        update();
      },
    );
  }

  Future<void> nowPlaying() async {
    (await _nowPlayingUseCase.execute()).fold(
      (l) {},
      (r) {
        nowPlayingData = r.results!;
        isLoading = true;
        update();
      },
    );
  }

  onPageChange(int index) {
    initialPage = index;
    imagePath = homeSlider![initialPage].backdropPath!;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    carouselController = CarouselController();
    pageController = PageController();
    home();
    popular();
    topRated();
    nowPlaying();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
