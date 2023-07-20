import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error_handler/error_handler.dart';
import 'package:movie_app/features/home/domain/model/movie_trending.dart';

abstract class NowPlayingRepository {
  Future<Either<Failure, MovieTrending>> nowPlaying();
}