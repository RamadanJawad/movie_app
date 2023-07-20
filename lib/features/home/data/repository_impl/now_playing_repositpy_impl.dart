import 'package:dartz/dartz.dart';
import 'package:movie_app/core/internet_checker/interent_checker.dart';
import 'package:movie_app/core/resources/manager_strings.dart';
import 'package:movie_app/features/home/data/data_source/remote_nowPlaying_data_source.dart';
import 'package:movie_app/features/home/data/mapper/nowPlaying_mapper.dart';
import 'package:movie_app/features/home/domain/model/movie_trending.dart';
import 'package:movie_app/features/home/domain/repository/now_playing_repository.dart';

import '../../../../core/error_handler/error_handler.dart';

class NowPlayingRepositoryImpl implements NowPlayingRepository {
  RemoteNowPlayingDataSource _remoteNowPlayingDataSource;
  NetworkInfo _networkInfo;

  NowPlayingRepositoryImpl(this._remoteNowPlayingDataSource, this._networkInfo);

  @override
  Future<Either<Failure, MovieTrending>> nowPlaying() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteNowPlayingDataSource.getNowPlayingData();
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
