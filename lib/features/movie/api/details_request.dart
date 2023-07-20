import 'package:dio/dio.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/config/dependency_injection.dart';
import 'package:movie_app/config/request_constants.dart';
import 'package:movie_app/core/storage/local/app_settings_prefs.dart';
import 'package:movie_app/features/movie/api/details_response.dart';

class MovieDetailsRequest {
  Future<MovieDetailsResponse> getDetailsMovie(int id) async {
    final dio = Dio();
    final AppSettingsPrefs appPreferences = instance<AppSettingsPrefs>();
    final response = await dio.get(RequestsConstants.movieDetails(id),
        options: Options(headers: {
          Constants.authorization: getAuthorization(Constants.apiKey),
          Constants.acceptLanguage: appPreferences.getLocale(),
          Constants.accept: Constants.applicationJson,
          Constants.contentType: Constants.applicationJson,
        }));
    if (response.statusCode == 200) {
      return MovieDetailsResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}

String getAuthorization(String token) {
  return '${Constants.bearer} $token';
}
