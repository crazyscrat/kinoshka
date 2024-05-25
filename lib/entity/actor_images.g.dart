// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorImages _$ActorImagesFromJson(Map<String, dynamic> json) => ActorImages(
      id: (json['id'] as num).toInt(),
      profiles: (json['profiles'] as List<dynamic>)
          .map((e) => ActorImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActorImagesToJson(ActorImages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profiles': instance.profiles.map((e) => e.toJson()).toList(),
    };

ActorImage _$ActorImageFromJson(Map<String, dynamic> json) => ActorImage(
      aspectRatio: (json['aspect_ratio'] as num).toDouble(),
      height: (json['height'] as num).toInt(),
      width: (json['width'] as num).toInt(),
      iso: json['iso_639_1'] as String?,
      filePath: json['file_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
    );

Map<String, dynamic> _$ActorImageToJson(ActorImage instance) =>
    <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'height': instance.height,
      'width': instance.width,
      'iso_639_1': instance.iso,
      'file_path': instance.filePath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
