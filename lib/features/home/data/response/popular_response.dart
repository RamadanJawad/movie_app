import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/features/home/data/response/trending_response.dart';
part 'popular_response.g.dart';

@JsonSerializable()
class PopularResponse {
  @JsonKey(name: ResponseConstants.results)
  List<TrendingResponse>? popularMovie;

  PopularResponse({this.popularMovie});
  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularResponseToJson(this);
}
