import 'package:get/get.dart';
import 'package:movie_app/core/cache/cache.dart';
import 'package:movie_app/features/movie/api/credit_request.dart';
import 'package:movie_app/features/movie/api/credit_response.dart';
import 'package:movie_app/features/movie/api/details_request.dart';
import 'package:movie_app/features/movie/api/details_response.dart';
import 'package:movie_app/features/movie/api/video_request.dart';
import 'package:movie_app/features/movie/api/video_response.dart';

class MovieDetailsController extends GetxController {
  MovieDetailsResponse? response;
  MovieCastResponse? movieCastResponse;
  List data = [];
  VideoResponse? videoResponse;
  List<Video> video_response = [];
  bool isLoading = false;
  CacheData cacheData = CacheData();
  String posterPath = '';
  String title = '';
  String overview = '';
  String releaseDate = '';
  num voteAverage = 0;
  String name = '';
  String character = '';
  List video = [];

  getVideoMovie() async {
    videoResponse = await VideoRequest().getVideo(cacheData.getMovieId());
    video_response = videoResponse!.video!;
    update();
  }

  getDetailsMovie() async {
    response =
        await MovieDetailsRequest().getDetailsMovie(cacheData.getMovieId());
    posterPath = response!.posterPath!;
    title = response!.title!;
    releaseDate = response!.releaseDate!;
    voteAverage = response!.voteAverage!;
    overview = response!.overview!;
    isLoading = true;
    update();
  }

  getCastMovie() async {
    movieCastResponse =
        await MovieCastRequest().getCastMovie(cacheData.getMovieId());
    data = movieCastResponse!.cast!;
    isLoading = true;
    update();
  }

  @override
  void onInit() {
    getDetailsMovie();
    getCastMovie();
    getVideoMovie();
    super.onInit();
  }
}
