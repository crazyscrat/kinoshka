// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideos _$MovieVideosFromJson(Map<String, dynamic> json) => MovieVideos(
      id: (json['id'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieVideosToJson(MovieVideos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

MovieVideo _$MovieVideoFromJson(Map<String, dynamic> json) => MovieVideo(
      iso639: json['iso_639_1'] as String?,
      iso3166: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
      key: json['key'] as String?,
      site: json['site'] as String?,
      size: (json['size'] as num).toInt(),
      type: json['type'] as String?,
      official: json['official'] as bool,
      publishedAt: json['published_at'] as String?,
      id: json['id'] as String,
    );

Map<String, dynamic> _$MovieVideoToJson(MovieVideo instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso639,
      'iso_3166_1': instance.iso3166,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt,
      'id': instance.id,
    };
