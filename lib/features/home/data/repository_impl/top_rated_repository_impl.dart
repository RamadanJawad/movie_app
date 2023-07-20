import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error_handler/error_handler.dart';
import 'package:movie_app/core/internet_checker/interent_checker.dart';
import 'package:movie_app/core/resources/manager_strings.dart';
import 'package:movie_app/features/home/data/data_source/remote_topRated_data_source.dart';
import 'package:movie_app/features/home/data/mapper/topRated_mapper.dart';
import 'package:movie_app/features/home/domain/model/movie_trending.dart';
import 'package:movie_app/features/home/domain/repository/top_rated_repository.dart';

class TopRatedRepositoryImpl implements TopRatedRepository {
  RemoteTopRatedDataSource _remoteHomeDataSource;
  NetworkInfo _networkInfo;

  TopRatedRepositoryImpl(this._remoteHomeDataSource, this._networkInfo);

  @override
  Future<Either<Failure, MovieTrending>> topRated() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteHomeDataSource.getTopRatedData();
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.NO_INTERNT_CONNECTION,
        ),
      );
    }
  }
}
