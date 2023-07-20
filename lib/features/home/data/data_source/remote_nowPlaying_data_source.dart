import 'package:movie_app/core/network/app_api.dart';
import 'package:movie_app/features/home/data/response/now_playing_response.dart';

abstract class RemoteNowPlayingDataSource {
  Future<NowPlayingResponse> getNowPlayingData();
}

class RemoteNowPlayingDataSourceImplement implements RemoteNowPlayingDataSource {
  AppService _appService;
  RemoteNowPlayingDataSourceImplement(this._appService);

  @override
  Future<NowPlayingResponse> getNowPlayingData() async {
    return await _appService.nowPlayingMovie();
  }
}