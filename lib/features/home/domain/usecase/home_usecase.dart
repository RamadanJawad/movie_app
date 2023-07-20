import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error_handler/error_handler.dart';
import 'package:movie_app/features/home/domain/model/movie_trending.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';

class HomeUseCase{
  final HomeRepository _repository;

  HomeUseCase(this._repository);

  Future<Either<Failure, MovieTrending>> execute() async {
    return await _repository.home();
  }
}
