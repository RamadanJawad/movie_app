import 'package:movie_app/core/network/app_api.dart';
import 'package:movie_app/features/home/data/response/top_rated_response.dart';

abstract class RemoteTopRatedDataSource {
  Future<TopRatedResponse> getTopRatedData();
}

class RemoteTopRatedDataSourceImplement implements RemoteTopRatedDataSource {
  AppService _appService;
  RemoteTopRatedDataSourceImplement(this._appService);

  @override
  Future<TopRatedResponse> getTopRatedData() async {
    return await _appService.topRatedMovie();
  }
}