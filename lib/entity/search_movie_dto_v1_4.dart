import 'package:kinoshka/entity/external_id.dart';
import 'package:kinoshka/entity/name.dart';
import 'package:kinoshka/entity/rating.dart';
import 'package:kinoshka/entity/url_info.dart';
import 'package:kinoshka/entity/votes.dart';
import 'package:kinoshka/entity/year_range.dart';

class SearchMovieDtoV14{
  int id;
  String? name;
  String? alternativeName;
  String? enName;
  String? type;
  int? year;
  String? description;
  String? shortDescription;
  int? movieLength;
  List<Name>? names;
  ExternalId? externalId;
  List<String>? logo;
  UrlInfo? poster;
  UrlInfo? backdrop;
  Rating? rating;
  Votes? votes;
  List<String>? genres;
  List<String>? countries;
  List<YearRange>? releaseYears;
  bool? isSeries;
  bool? ticketsOnSale;
  int? totalSeriesLength;
  int? seriesLength;
  String? ratingMpaa;
  int? ageRating;
  int? top10;
  int? top250;
  int? typeNumber;
  String? status;

  SearchMovieDtoV14(
      {required this.id,
      this.name,
      this.alternativeName,
      this.enName,
      this.type,
      this.year,
      this.description,
      this.shortDescription,
      this.movieLength,
      this.names,
      this.externalId,
      this.logo,
      this.poster,
      this.backdrop,
      this.rating,
      this.votes,
      this.genres,
      this.countries,
      this.releaseYears,
      this.isSeries,
      this.ticketsOnSale,
      this.totalSeriesLength,
      this.seriesLength,
      this.ratingMpaa,
      this.ageRating,
      this.top10,
      this.top250,
      this.typeNumber,
      this.status});
}