import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movie_app/core/internet_checker/interent_checker.dart';
import 'package:movie_app/core/network/app_api.dart';
import 'package:movie_app/core/network/dio_factory.dart';
import 'package:movie_app/core/storage/local/app_settings_prefs.dart';
import 'package:movie_app/features/home/data/data_source/remote_home_data_source.dart';
import 'package:movie_app/features/home/data/data_source/remote_nowPlaying_data_source.dart';
import 'package:movie_app/features/home/data/data_source/remote_popular_data_source.dart';
import 'package:movie_app/features/home/data/data_source/remote_topRated_data_source.dart';
import 'package:movie_app/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:movie_app/features/home/data/repository_impl/now_playing_repositpy_impl.dart';
import 'package:movie_app/features/home/data/repository_impl/popular_repository_impl.dart';
import 'package:movie_app/features/home/data/repository_impl/top_rated_repository_impl.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/domain/repository/now_playing_repository.dart';
import 'package:movie_app/features/home/domain/repository/popular_repository.dart';
import 'package:movie_app/features/home/domain/repository/top_rated_repository.dart';
import 'package:movie_app/features/home/domain/usecase/home_usecase.dart';
import 'package:movie_app/features/home/domain/usecase/now_playing_usecase.dart';
import 'package:movie_app/features/home/domain/usecase/popular_usecase.dart';
import 'package:movie_app/features/home/domain/usecase/top_rated_usecase.dart';
import 'package:movie_app/features/home/presentation/controller/home_controller.dart';
import 'package:movie_app/features/movie/presentation/controller/movie_detalis_controller.dart';
import 'package:movie_app/features/movie/presentation/controller/video_controller.dart';
import 'package:movie_app/features/search/presentation/controller/search_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  if (!GetIt.I.isRegistered<AppSettingsPrefs>()) {
    instance.registerLazySingleton<AppSettingsPrefs>(
        () => AppSettingsPrefs(instance()));
  }
  if (!GetIt.I.isRegistered<SharedPreferences>()) {
    instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  }
  if (!GetIt.I.isRegistered<NetworkInfo>()) {
    instance.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImp(InternetConnectionCheckerPlus()));
  }
  if (!GetIt.I.isRegistered<DioFactory>()) {
    instance.registerLazySingleton<DioFactory>(() => DioFactory());
  }
  Dio dio = await instance<DioFactory>().getDio();
  if (!GetIt.I.isRegistered<AppService>()) {
    instance.registerLazySingleton<AppService>(() => AppService(dio));
  }
}

initHome() async {
  if (!GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.registerLazySingleton<RemoteHomeDataSource>(
        () => RemoteHomeDataSourceImplement(instance<AppService>()));
  }
  if (!GetIt.I.isRegistered<HomeRepository>()) {
    instance.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(instance(), instance()));
  }
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(
        () => HomeUseCase(instance<HomeRepository>()));
  }
  /////////////////////////////////////////////////////////////
  if (!GetIt.I.isRegistered<RemotePopularDataSource>()) {
    instance.registerLazySingleton<RemotePopularDataSource>(
        () => RemotePopularDataSourceImplement(instance<AppService>()));
  }
  if (!GetIt.I.isRegistered<PopularRepository>()) {
    instance.registerLazySingleton<PopularRepository>(
        () => PopularRepositoryImpl(instance(), instance()));
  }
  if (!GetIt.I.isRegistered<PopularUseCase>()) {
    instance.registerFactory<PopularUseCase>(
        () => PopularUseCase(instance<PopularRepository>()));
  }
  /////////////////////////////////////////////////////////////
  if (!GetIt.I.isRegistered<RemoteTopRatedDataSource>()) {
    instance.registerLazySingleton<RemoteTopRatedDataSource>(
        () => RemoteTopRatedDataSourceImplement(instance<AppService>()));
  }
  if (!GetIt.I.isRegistered<TopRatedRepository>()) {
    instance.registerLazySingleton<TopRatedRepository>(
        () => TopRatedRepositoryImpl(instance(), instance()));
  }
  if (!GetIt.I.isRegistered<TopRatedUseCase>()) {
    instance.registerFactory<TopRatedUseCase>(
        () => TopRatedUseCase(instance<TopRatedRepository>()));
  }
  /////////////////////////////////////////////////////////////
  if (!GetIt.I.isRegistered<RemoteNowPlayingDataSource>()) {
    instance.registerLazySingleton<RemoteNowPlayingDataSource>(
        () => RemoteNowPlayingDataSourceImplement(instance<AppService>()));
  }
  if (!GetIt.I.isRegistered<NowPlayingRepository>()) {
    instance.registerLazySingleton<NowPlayingRepository>(
        () => NowPlayingRepositoryImpl(instance(), instance()));
  }
  if (!GetIt.I.isRegistered<NowPlayingUseCase>()) {
    instance.registerFactory<NowPlayingUseCase>(
        () => NowPlayingUseCase(instance<NowPlayingRepository>()));
  }
  Get.put(HomeController());
}

disposeHome() {}

initMovieDetails() {
  Get.put(MovieDetailsController());
}

initVideoController() {
  Get.put(VideoController());
}

initSearchController() {
  Get.put(SearchController());
}
