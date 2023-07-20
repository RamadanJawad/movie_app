class CacheData {
  static int movieId = 0;
  static String nameVideo = "";
  static String keyVideo = "";
  static List movieDetails = [];

  void setMovieDetails(List data) {
    movieDetails = data;
  }

  List getMovieDetails() {
    return movieDetails;
  }

  void setMovieId(int id) {
    movieId = id;
  }

  int getMovieId() {
    return movieId;
  }

  void setNameVideo(String name) {
    nameVideo = name;
  }

  String getNameVideo() {
    return nameVideo;
  }

  void setKeyVideo(String key) {
    keyVideo = key;
  }

  String getKeyVideo() {
    return keyVideo;
  }
}
