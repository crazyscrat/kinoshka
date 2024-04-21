import 'dart:convert';
import 'dart:io';

import 'package:kinoshka/entity/currency_value.dart';
import 'package:kinoshka/entity/docs.dart';
import 'package:kinoshka/entity/fact_in_movie.dart';
import 'package:kinoshka/entity/movie_dto_v14.dart';
import 'package:kinoshka/entity/person_in_movie.dart';
import 'package:kinoshka/entity/premiere.dart';
import 'package:kinoshka/entity/rating.dart';
import 'package:kinoshka/entity/search_movie_dto_v1_4.dart';
import 'package:kinoshka/entity/url_info.dart';
import 'package:kinoshka/settings/settings_const.dart';

class ApiClient {
  final _client = HttpClient();
  static const _host = SettingConst.host;
  static const _apiKey = SettingConst.apiKey;

  Future<Docs> getTop250({required int page}) async {
    final url =
        Uri.parse('$_host/movie?page=$page&limit=10&type=movie&lists=top250');

    final request = await _client.getUrl(url);
    request.headers.contentType = ContentType.json;
    request.headers.add('X-API-KEY', _apiKey);
    final response = await request.close();

    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);

    final jsonDoc = json['docs'] as List<dynamic>;

    Docs docs;
    List<SearchMovieDtoV14> list = <SearchMovieDtoV14>[];

    jsonDoc.forEach((element) {
      int id = element['id'];
      SearchMovieDtoV14 movie = SearchMovieDtoV14(id: id);
      movie.name = element['name'];
      movie.description = element['description'];
      movie.movieLength = element['movieLength'];
      movie.shortDescription = element['shortDescription'];
      movie.type = element['type'];
      movie.alternativeName = element['alternativeName'];
      movie.year = element['year'];

      movie.countries = <String>[];
      var countries = element['countries'] as List<dynamic>;
      for (var e in countries) {
        movie.countries?.add(e['name']);
      }

      movie.genres = <String>[];
      var genres = element['genres'] as List<dynamic>;
      for (var e in genres) {
        movie.genres?.add(e['name']);
      }

      // movie.logo = <String>[];
      // var logo = element['logo'] as Map<String, dynamic>;
      // movie.logo?.add(logo['url']);

      var r = element['rating'] as Map<String, dynamic>;
      Rating rating = Rating();
      rating.kp = r['kp']?.toDouble();
      rating.imdb = r['imdb']?.toDouble();
      rating.tmdb = r['tmdb']?.toDouble();
      rating.filmCritics = r['filmCritics']?.toDouble();
      rating.russianFilmCritics = r['russianFilmCritics']?.toDouble();
      movie.rating = rating;


      var poster = element['poster'] as Map<String, dynamic>;
      movie.poster = UrlInfo();
      movie.poster?.url = poster['url'];
      movie.poster?.previewUrl = poster['previewUrl'];

      var backdrop = element['backdrop'] as Map<String, dynamic>;
      movie.backdrop = UrlInfo();
      movie.backdrop?.url = backdrop['url'];
      movie.backdrop?.previewUrl = backdrop['previewUrl'];

      list.add(movie);
    });

    docs = Docs(docs: list);
    docs.page = json['page'];
    docs.limit = json['limit'];
    docs.total = json['total'];
    docs.pages = json['pages'];

    return docs;
  }

  Future<MovieDtoV14> getMovieFullInfo({required int id}) async {
    final url = Uri.parse('$_host/movie/$id');

    final request = await _client.getUrl(url);
    request.headers.contentType = ContentType.json;
    request.headers.add('X-API-KEY', _apiKey);
    final response = await request.close();

    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);

    MovieDtoV14 movie = MovieDtoV14(id: id);

    movie.name = json['name'];
    movie.description = json['description'];
    movie.movieLength = json['movieLength'];
    movie.shortDescription = json['shortDescription'];
    movie.type = json['type'];
    movie.alternativeName = json['alternativeName'];
    movie.year = json['year'];

    movie.countries = <String>[];
    var countries = json['countries'] as List<dynamic>;
    for (var e in countries) {
      movie.countries?.add(e['name']);
    }

    movie.genres = <String>[];
    var genres = json['genres'] as List<dynamic>;
    for (var e in genres) {
      movie.genres?.add(e['name']);
    }

    movie.logo = <String>[];
    var logo = json['logo'] as Map<String, dynamic>;
    movie.logo?.add(logo['url']);

    var r = json['rating'] as Map<String, dynamic>;
    Rating rating = Rating();
    rating.kp = r['kp']?.toDouble();
    rating.imdb = r['imdb']?.toDouble();
    rating.tmdb = r['tmdb']?.toDouble();
    rating.filmCritics = r['filmCritics']?.toDouble();
    rating.russianFilmCritics = r['russianFilmCritics']?.toDouble();
    movie.rating = rating;


    var poster = json['poster'] as Map<String, dynamic>;
    movie.poster = UrlInfo();
    movie.poster?.url = poster['url'];
    movie.poster?.previewUrl = poster['previewUrl'];

    var backdrop = json['backdrop'] as Map<String, dynamic>;
    movie.backdrop = UrlInfo();
    movie.backdrop?.url = backdrop['url'];
    movie.backdrop?.previewUrl = backdrop['previewUrl'];

    var budget = json['budget'] as Map<String, dynamic>;
    movie.budget = CurrencyValue();
    movie.budget?.value = budget['value'];
    movie.budget?.currency = budget['currency'];

    var fees = json['fees'] as Map<String, dynamic>;
    var usa = fees['usa'] as Map<String, dynamic>;
    var world = fees['world'] as Map<String, dynamic>;
    var russia = fees['russia'] as Map<String, dynamic>;
    movie.fees = Fees();
    movie.fees?.usa = CurrencyValue(value: usa['value'], currency: usa['currency']);
    movie.fees?.world = CurrencyValue(value: world['value'], currency: world['currency']);
    movie.fees?.russia = CurrencyValue(value: russia['value'], currency: russia['currency']);

    var facts = json['facts'] as List<dynamic>;
    movie.facts = <FactInMovie>[];
    facts.forEach((element) {
      FactInMovie fact = FactInMovie(value: element['value']);
      fact.type = element['type'];
      fact.spoiler = element['spoiler'];

      movie.facts?.add(fact);
    });

    movie.premiere = Premiere();
    var premiere = json['premiere'] as Map<String, dynamic>;
    movie.premiere?.russia = premiere['russia'];
    movie.premiere?.world = premiere['world'];
    movie.premiere?.bluray = premiere['bluray'];
    movie.premiere?.cinema = premiere['cinema'];
    movie.premiere?.country = premiere['country'];
    movie.premiere?.digital = premiere['digital'];
    movie.premiere?.dvd = premiere['dvd'];

    var persons = json['persons'] as List<dynamic>;
    movie.persons = <PersonInMovie>[];
    persons.forEach((element) {
      var e = element as Map<String, dynamic>;
      PersonInMovie person = PersonInMovie(id: e['id']);
      person.description = e['description'];
      person.name = e['name'];
      person.profession = e['profession'];
      person.photo = e['photo'];
      person.enName = e['enName'];
      person.enProfession = e['enProfession'];

      movie.persons?.add(person);
    });

    return movie;
  }
}
