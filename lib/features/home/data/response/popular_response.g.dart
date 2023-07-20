// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularResponse _$PopularResponseFromJson(Map<String, dynamic> json) =>
    PopularResponse(
      popularMovie: (json['results'] as List<dynamic>?)
          ?.map((e) => TrendingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PopularResponseToJson(PopularResponse instance) =>
    <String, dynamic>{
      'results': instance.popularMovie,
    };
