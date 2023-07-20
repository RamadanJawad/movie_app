class RequestsConstants {
  static const String trending = 'trending/movie/day';
  static const String popular = 'movie/popular';
  static const String nowPlaying = 'movie/now_playing';
  static const String topRated = 'movie/top_rated';
  static String movieDetails(int id) {
    return "https://api.themoviedb.org/3/movie/$id";
  }

  static String movieCast(int id) {
    return "https://api.themoviedb.org/3/movie/$id/credits";
  }

  static String movieVideo(int id) {
    return "https://api.themoviedb.org/3/movie/$id/videos";
  }

  static String searchMovie(String word) {
    return "https://api.themoviedb.org/3/search/movie?query=$word";
  }
}
