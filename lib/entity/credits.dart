import 'package:json_annotation/json_annotation.dart';
import 'package:kinoshka/entity/actor.dart';
import 'package:kinoshka/entity/crew.dart';

part 'credits.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Credits {
  //final int id;
  @JsonKey(name: 'cast')
  final List<Actor> actors;
  final List<Crew> crew;

  Credits({
    //required this.id,
    required this.actors,
    required this.crew,
  });

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsToJson(this);
}
