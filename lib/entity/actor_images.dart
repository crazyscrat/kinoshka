import 'package:json_annotation/json_annotation.dart';

part 'actor_images.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ActorImages{
  final int id;
  final List<ActorImage> profiles;

  ActorImages({required this.id, required this.profiles});

  factory ActorImages.fromJson(Map<String, dynamic> json) => _$ActorImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ActorImagesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ActorImage{
  final double aspectRatio;
  final int height;
  final int width;
  @JsonKey(name: 'iso_639_1')
  final String? iso;
  final String? filePath;
  final double voteAverage;
  final int voteCount;

  ActorImage({required this.aspectRatio, required this.height, required this.width, required this.iso, required this.filePath, required this.voteAverage, required this.voteCount});

  factory ActorImage.fromJson(Map<String, dynamic> json) => _$ActorImageFromJson(json);
  Map<String, dynamic> toJson() => _$ActorImageToJson(this);
}