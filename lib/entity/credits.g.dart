// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credits _$CreditsFromJson(Map<String, dynamic> json) => Credits(
      actors: (json['cast'] as List<dynamic>)
          .map((e) => Actor.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreditsToJson(Credits instance) => <String, dynamic>{
      'cast': instance.actors.map((e) => e.toJson()).toList(),
      'crew': instance.crew.map((e) => e.toJson()).toList(),
    };
