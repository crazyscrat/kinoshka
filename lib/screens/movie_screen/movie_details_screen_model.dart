import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kinoshka/domain/api_client/api_exception.dart';
import 'package:kinoshka/domain/services/auth_service.dart';
import 'package:kinoshka/domain/services/movie_service.dart';
import 'package:kinoshka/entity/actor_images.dart';
import 'package:kinoshka/entity/movie_details.dart';
import 'package:kinoshka/library/widgets/localized_model_storage.dart';
import 'package:kinoshka/navigation/main_navigation.dart';

class MovieDetailsScreenModel extends ChangeNotifier {
  final _authService = AuthService();
  final _movieService = MovieService();

  final int _movieId;
  final _localizedModelStorage = LocalizedModelStorage();
  MovieDetails? _movieDetails;
  MovieDetails? get movieDetails => _movieDetails;
  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;
  late DateFormat _dateFormat;

  MovieDetailsScreenModel(this._movieId);

  Future<void> setLocale(BuildContext context, Locale locale) async {
    if(!_localizedModelStorage.updateLocale(locale)) return;
    _dateFormat = DateFormat.yMMMMd(_localizedModelStorage.localeTag);
    loadMovieDetails(context);
  }

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Map<int, ActorImages> mapActorImages = {};

  Future<void> loadActorImages(int actorId) async {
    final actorImages = await _movieService.loadActorImages(actorId: actorId, locale: _localizedModelStorage.localeTag);
    mapActorImages[actorId] = actorImages;
    notifyListeners();
  }

  String getGenres() {
    List<String> genres = [];
    if (_movieDetails?.genres != null) {
      int length = _movieDetails?.genres.length as int;
      for (var i = 0; i < length; i++) {
        genres.add(_movieDetails?.genres[i].name as String);
      }
    }
    return genres.join(', ');
  }

  String getCountries() {
    String countries = '';
    if (_movieDetails?.productionCountries != null) {
      int length = _movieDetails?.productionCountries.length as int;
      for (var i = 0; i < length; i++) {
        countries += _movieDetails!.productionCountries[i].name!;
        if (i + 1 < length) {
          countries += ', ';
        }
      }
    }
    return countries;
  }

  Future<void> loadMovieDetails(BuildContext context) async {
    try {
      final movieDetailsLocal = await _movieService.loadMovieDetails(movieId: _movieId, locale: _localizedModelStorage.localeTag);
      _movieDetails = movieDetailsLocal.movieDetails;
      _isFavorite = movieDetailsLocal.isFavorite;
      notifyListeners();
    } on ApiClientException catch(e) {
      _handleApiClientException(e, context);
    }
  }

  Future<void> toggleFavorite(BuildContext context) async {
    try {
      await _movieService.toggleFavorite(isFavorite: _isFavorite, movieId: _movieId);
      _isFavorite = !_isFavorite;
    } on ApiClientException catch(e) {
      _handleApiClientException(e, context);
    }
    notifyListeners();
  }

  void openTrailerScreen(BuildContext context, String trailerKey) {
    Navigator.of(context).pushNamed(
        MainNavigationRouteNames.trailerScreen, arguments: trailerKey);
  }

  void _handleApiClientException(ApiClientException e, BuildContext context,){
    switch(e.type){
      case ApiClientExceptionType.sessionExpired:
        _authService.logOut();
        MainNavigation.resetNavigation(context);
      default:
        //print(e);
    }
  }

  Future<void> resetSession(BuildContext context) async{
    _authService.logOut();
    MainNavigation.resetNavigation(context);
  }
}
