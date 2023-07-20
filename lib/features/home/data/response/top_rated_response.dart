import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/features/home/data/response/trending_response.dart';
part 'top_rated_response.g.dart';

@JsonSerializable()
class TopRatedResponse {
  @JsonKey(name: ResponseConstants.results)
  List<TrendingResponse>? topRatedMovie;

  TopRatedResponse({this.topRatedMovie});
  factory TopRatedResponse.fromJson(Map<String, dynamic> json) =>
      _$TopRatedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedResponseToJson(this);
}
