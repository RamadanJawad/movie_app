import 'package:dio/dio.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/config/request_constants.dart';
import 'package:movie_app/features/home/data/response/home_response.dart';
import 'package:movie_app/features/home/data/response/now_playing_response.dart';
import 'package:movie_app/features/home/data/response/popular_response.dart';
import 'package:movie_app/features/home/data/response/top_rated_response.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  @GET(RequestsConstants.trending)
  Future<HomeResponse> home();

  @GET(RequestsConstants.popular)
  Future<PopularResponse> popularMovie();

  @GET(RequestsConstants.topRated)
  Future<TopRatedResponse> topRatedMovie();

  @GET(RequestsConstants.nowPlaying)
  Future<NowPlayingResponse> nowPlayingMovie();
}
