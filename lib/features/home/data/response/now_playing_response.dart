import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/features/home/data/response/trending_response.dart';
part 'now_playing_response.g.dart';

@JsonSerializable()
class NowPlayingResponse {
  @JsonKey(name: ResponseConstants.results)
  List<TrendingResponse>? nowPlayingMovie;

  NowPlayingResponse({this.nowPlayingMovie});
  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingResponseToJson(this);
}
