import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/config/constants.dart';

part 'trending_response.g.dart';

@JsonSerializable()
class TrendingResponse {
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.adult)
  bool? adult;
  @JsonKey(name: ResponseConstants.backdropPath)
  String? backdropPath;
  @JsonKey(name: ResponseConstants.title)
  String? title;
  @JsonKey(name: ResponseConstants.originalLanguage)
  String? originalLanguage;
  @JsonKey(name: ResponseConstants.originalTitle)
  String? originalTitle;
  @JsonKey(name: ResponseConstants.overview)
  String? overview;
  @JsonKey(name: ResponseConstants.posterPath)
  String? posterPath;
  @JsonKey(name: ResponseConstants.mediaType)
  String? mediaType;
  @JsonKey(name: ResponseConstants.popularity)
  double? popularity;
  @JsonKey(name: ResponseConstants.releaseDate)
  String? releaseDate;
  @JsonKey(name: ResponseConstants.video)
  bool? video;
  @JsonKey(name: ResponseConstants.voteAverage)
  double? voteAverage;
  @JsonKey(name: ResponseConstants.voteCount)
  int? voteCount;
  @JsonKey(name: ResponseConstants.genreIds)
  List<int>? genreIds;

  TrendingResponse(
      {this.id,
      this.adult,
      this.title,
      this.backdropPath,
      this.genreIds,
      this.mediaType,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory TrendingResponse.fromJson(Map<String, dynamic> json) =>
      _$TrendingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingResponseToJson(this);
}
