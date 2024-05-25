import 'package:json_annotation/json_annotation.dart';
import 'package:kinoshka/entity/credits.dart';
import 'package:kinoshka/entity/movie_date_parser.dart';
import 'package:kinoshka/entity/movie_videos.dart';

part 'movie_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetails {
  final bool adult;
  final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final String? homepage;
  final int id;
  final String? imdbId;
  final int budget;
  final String originalLanguage;
  final String originalTitle;
  final List<String> originCountry;
  final String? overview;
  final double popularity;
  final String? posterPath;
  @JsonKey(fromJson: parseMovieDateFromString)
  final DateTime? releaseDate;
  final String title;
  final String status;
  final String? tagline;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final int revenue;
  final int? runtime;
  final List<Genres> genres;
  final List<ProductionCompanies> productionCompanies;
  final List<ProductionCountries> productionCountries;
  final List<SpokenLanguages> spokenLanguages;
  final Credits? credits;
  final MovieVideos? videos;

  MovieDetails({
    required this.belongsToCollection,
    required this.homepage,
    required this.imdbId,
    required this.budget,
    required this.status,
    required this.tagline,
    required this.revenue,
    required this.runtime,
    required this.productionCompanies,
    required this.productionCountries,
    required this.spokenLanguages,
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.originCountry,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.credits,
    required this.videos,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SpokenLanguages{
  final String? englishName;
  @JsonKey(name: 'iso_639_1')
  final String? iso;
  final String? name;

  SpokenLanguages({required this.englishName, required this.iso, required this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) => _$SpokenLanguagesFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCountries{
  @JsonKey(name: 'iso_639_1')
  final String? iso;
  final String? name;

  ProductionCountries({required this.iso, required this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) => _$ProductionCountriesFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCompanies{
  final int id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompanies({required this.id, required this.logoPath, required this.name, required this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) => _$ProductionCompaniesFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Genres{
  final int id;
  final String? name;

  Genres({required this.id, required this.name});

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BelongsToCollection{
  final int id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  BelongsToCollection({required this.id, required this.name, required this.posterPath, required this.backdropPath});

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) => _$BelongsToCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}