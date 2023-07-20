import 'package:movie_app/features/home/data/mapper/trending_mapper.dart';
import 'package:movie_app/features/home/data/response/home_response.dart';
import 'package:movie_app/features/home/data/response/trending_response.dart';
import 'package:movie_app/features/home/domain/model/movie_trending.dart';

extension HomeMapper on HomeResponse {
  MovieTrending toDomain() {
    return MovieTrending(
        results: this
            .results
            ?.map((TrendingResponse trendingResponse) =>
                trendingResponse.toDomain())
            .toList());
  }
}
