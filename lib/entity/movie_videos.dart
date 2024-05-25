import 'package:json_annotation/json_annotation.dart';

part 'movie_videos.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieVideos{
  final int? id;
  final List<MovieVideo> results;

  MovieVideos({required this.id, required this.results});

  factory MovieVideos.fromJson(Map<String, dynamic> json) => _$MovieVideosFromJson(json);
  Map<String, dynamic> toJson() => _$MovieVideosToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieVideo{
  @JsonKey(name: 'iso_639_1')
  final String? iso639;
  @JsonKey(name: 'iso_3166_1')
  final String? iso3166;
  final String? name;
  final String? key;
  final String? site;
  final int size;
  final String? type;
  final bool official;
  final String? publishedAt;
  final String id;

  MovieVideo({required this.iso639, required this.iso3166, required this.name, required this.key, required this.site, required this.size, required this.type, required this.official, required this.publishedAt, required this.id});

  factory MovieVideo.fromJson(Map<String, dynamic> json) => _$MovieVideoFromJson(json);
  Map<String, dynamic> toJson() => _$MovieVideoToJson(this);
}