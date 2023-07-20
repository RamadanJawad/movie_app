// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedResponse _$TopRatedResponseFromJson(Map<String, dynamic> json) =>
    TopRatedResponse(
      topRatedMovie: (json['results'] as List<dynamic>?)
          ?.map((e) => TrendingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopRatedResponseToJson(TopRatedResponse instance) =>
    <String, dynamic>{
      'results': instance.topRatedMovie,
    };
