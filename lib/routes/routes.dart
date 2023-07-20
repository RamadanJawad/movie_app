import 'package:flutter/material.dart';
import 'package:movie_app/config/dependency_injection.dart';
import 'package:movie_app/core/resources/manager_strings.dart';
import 'package:movie_app/features/home/presentation/view/screen/home_screen.dart';
import 'package:movie_app/features/movie/presentation/view/screen/movie_details_view.dart';
import 'package:movie_app/features/movie/presentation/view/screen/watch_video.dart';
import 'package:movie_app/features/search/presentation/view/screen/search_screen.dart';
import 'package:movie_app/features/splash/presentation/view/splash_screen.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String homeView = '/home_view';
  static const String movieDetails = '/movie_details';
  static const String watchVideo = '/watch_video';
  static const String searchVideo = '/search_video';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeView:
        initHome();
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.movieDetails:
        initMovieDetails();
        return MaterialPageRoute(builder: (_) => const MovieDetailsScreen());
      case Routes.watchVideo:
        initVideoController();
        return MaterialPageRoute(builder: (_) => const WatchVideo());
      case Routes.searchVideo:
        initSearchController();
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(ManagerStrings.noRouteFound),
        ),
        body: Center(
          child: Text(ManagerStrings.noRouteFound),
        ),
      ),
    );
  }
}
