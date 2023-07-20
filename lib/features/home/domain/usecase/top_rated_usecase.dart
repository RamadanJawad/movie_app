import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error_handler/error_handler.dart';
import 'package:movie_app/features/home/domain/model/movie_trending.dart';
import 'package:movie_app/features/home/domain/repository/top_rated_repository.dart';

class TopRatedUseCase{
  final TopRatedRepository _repository;

  TopRatedUseCase(this._repository);

  Future<Either<Failure, MovieTrending>> execute() async {
    return await _repository.topRated();
  }
}