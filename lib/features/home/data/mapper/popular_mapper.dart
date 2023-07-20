import 'package:movie_app/features/home/data/response/popular_response.dart';
import 'package:movie_app/features/home/data/response/trending_response.dart';
import 'package:movie_app/features/home/domain/model/movie_trending.dart';
import 'package:movie_app/features/home/domain/model/results.dart';

extension PopularMapper on PopularResponse {
  MovieTrending toDomain() {
    return MovieTrending(
        results: this
            .popularMovie
            ?.map((TrendingResponse trendingResponse) =>
                trendingResponse.toDomain())
            .toList());
  }
}

extension PopularResponseMapper on TrendingResponse {
  Results toDomain() {
    return Results(
        adult: this.adult,
        title: this.title,
        id: this.id,
        originalTitle: this.originalTitle,
        overview: this.overview,
        backdropPath: this.backdropPath,
        posterPath: this.posterPath,
        releaseDate: this.releaseDate,
        voteAverage: this.voteAverage,
        genreIds: [],
        mediaType: this.mediaType,
        popularity: this.popularity,
        video: this.video,
        originalLanguage: this.originalLanguage,
        voteCount: this.voteCount);
  }
}
