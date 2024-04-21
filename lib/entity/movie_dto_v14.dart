import 'package:kinoshka/entity/audience.dart';
import 'package:kinoshka/entity/collection_list.dart';
import 'package:kinoshka/entity/currency_value.dart';
import 'package:kinoshka/entity/external_id.dart';
import 'package:kinoshka/entity/fact_in_movie.dart';
import 'package:kinoshka/entity/linked_movie_V14.dart';
import 'package:kinoshka/entity/name.dart';
import 'package:kinoshka/entity/network_item_v14.dart';
import 'package:kinoshka/entity/person_in_movie.dart';
import 'package:kinoshka/entity/premiere.dart';
import 'package:kinoshka/entity/production_company.dart';
import 'package:kinoshka/entity/rating.dart';
import 'package:kinoshka/entity/review_info.dart';
import 'package:kinoshka/entity/seasons_info.dart';
import 'package:kinoshka/entity/url_info.dart';
import 'package:kinoshka/entity/video.dart';
import 'package:kinoshka/entity/votes.dart';
import 'package:kinoshka/entity/watchability.dart';
import 'package:kinoshka/entity/year_range.dart';

class MovieDtoV14{
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
  String? slogan;
  List<FactInMovie>? facts;
  VideoTypes? videos;
  List<PersonInMovie>? persons;
  ReviewInfo? reviewInfo;
  List<SeasonInfo>? seasonsInfo;
  CurrencyValue? budget;
  Fees? fees;
  Premiere? premiere;
  List<LinkedMovieV14>? similarMovies;
  List<LinkedMovieV14>? sequelsAndPrequels;
  Watchability? watchability;
  List<Audience>? audience;
  List<String>? lists;
  List<NetworkItemV14>? networks;
  String? updatedAt;
  String? createdAt;
  List<ProductionCompany>? productionCompanies;

  MovieDtoV14(
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
      this.status,
      this.slogan,
      this.facts,
      this.videos,
      this.persons,
      this.reviewInfo,
      this.seasonsInfo,
      this.budget,
      this.fees,
      this.premiere,
      this.watchability,
      this.audience,
      this.lists,
      this.networks,
      this.updatedAt,
      this.createdAt,
      this.productionCompanies,
      this.similarMovies,
      this.sequelsAndPrequels,});
}