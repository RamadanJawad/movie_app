import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error_handler/error_handler.dart';
import 'package:movie_app/core/internet_checker/interent_checker.dart';
import 'package:movie_app/features/home/data/data_source/remote_home_data_source.dart';
import 'package:movie_app/features/home/data/mapper/home_mapper.dart';
import 'package:movie_app/features/home/domain/model/movie_trending.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import '../../../../core/resources/manager_strings.dart';

class HomeRepositoryImpl implements HomeRepository {
  RemoteHomeDataSource _remoteHomeDataSource;
  NetworkInfo _networkInfo;

  HomeRepositoryImpl(this._remoteHomeDataSource, this._networkInfo);

  @override
  Future<Either<Failure, MovieTrending>> home() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteHomeDataSource.getHomeData();
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
