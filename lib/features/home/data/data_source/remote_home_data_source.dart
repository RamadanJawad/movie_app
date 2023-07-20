import 'package:movie_app/core/network/app_api.dart';
import '../response/home_response.dart';

abstract class RemoteHomeDataSource {
  Future<HomeResponse> getHomeData();
}

class RemoteHomeDataSourceImplement implements RemoteHomeDataSource {
  AppService _appService;
  RemoteHomeDataSourceImplement(this._appService);
  
  @override
  Future<HomeResponse> getHomeData() async {
    return await _appService.home();
  }
}
