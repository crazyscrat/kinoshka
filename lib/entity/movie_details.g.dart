// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
      belongsToCollection: json['belongs_to_collection'] == null
          ? null
          : BelongsToCollection.fromJson(
              json['belongs_to_collection'] as Map<String, dynamic>),
      homepage: json['homepage'] as String?,
      imdbId: json['imdb_id'] as String?,
      budget: (json['budget'] as num).toInt(),
      status: json['status'] as String,
      tagline: json['tagline'] as String?,
      revenue: (json['revenue'] as num).toInt(),
      runtime: (json['runtime'] as num?)?.toInt(),
      productionCompanies: (json['production_companies'] as List<dynamic>)
          .map((e) => ProductionCompanies.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>)
          .map((e) => ProductionCountries.fromJson(e as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>)
          .map((e) => SpokenLanguages.fromJson(e as Map<String, dynamic>))
          .toList(),
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      id: (json['id'] as num).toInt(),
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      originCountry: (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: parseMovieDateFromString(json['release_date'] as String?),
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
      credits: json['credits'] == null
          ? null
          : Credits.fromJson(json['credits'] as Map<String, dynamic>),
      videos: json['videos'] == null
          ? null
          : MovieVideos.fromJson(json['videos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection?.toJson(),
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'budget': instance.budget,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'origin_country': instance.originCountry,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate?.toIso8601String(),
      'title': instance.title,
      'status': instance.status,
      'tagline': instance.tagline,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'production_companies':
          instance.productionCompanies.map((e) => e.toJson()).toList(),
      'production_countries':
          instance.productionCountries.map((e) => e.toJson()).toList(),
      'spoken_languages':
          instance.spokenLanguages.map((e) => e.toJson()).toList(),
      'credits': instance.credits?.toJson(),
      'videos': instance.videos?.toJson(),
    };

SpokenLanguages _$SpokenLanguagesFromJson(Map<String, dynamic> json) =>
    SpokenLanguages(
      englishName: json['english_name'] as String?,
      iso: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpokenLanguagesToJson(SpokenLanguages instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso,
      'name': instance.name,
    };

ProductionCountries _$ProductionCountriesFromJson(Map<String, dynamic> json) =>
    ProductionCountries(
      iso: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductionCountriesToJson(
        ProductionCountries instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso,
      'name': instance.name,
    };

ProductionCompanies _$ProductionCompaniesFromJson(Map<String, dynamic> json) =>
    ProductionCompanies(
      id: (json['id'] as num).toInt(),
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );

Map<String, dynamic> _$ProductionCompaniesToJson(
        ProductionCompanies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };

Genres _$GenresFromJson(Map<String, dynamic> json) => Genres(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

BelongsToCollection _$BelongsToCollectionFromJson(Map<String, dynamic> json) =>
    BelongsToCollection(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
    );

Map<String, dynamic> _$BelongsToCollectionToJson(
        BelongsToCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
    };
