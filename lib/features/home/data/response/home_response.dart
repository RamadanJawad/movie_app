import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/features/home/data/response/trending_response.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  @JsonKey(name: ResponseConstants.results)
  List<TrendingResponse>? results;

  HomeResponse({this.results});
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
