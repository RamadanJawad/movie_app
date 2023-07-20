import 'package:movie_app/core/network/app_api.dart';
import 'package:movie_app/features/home/data/response/popular_response.dart';

abstract class RemotePopularDataSource {
  Future<PopularResponse> getPopularData();
}

class RemotePopularDataSourceImplement implements RemotePopularDataSource {
  AppService _appService;
  RemotePopularDataSourceImplement(this._appService);

  @override
  Future<PopularResponse> getPopularData() async {
    return await _appService.popularMovie();
  }
}
