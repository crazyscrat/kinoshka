import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:kinoshka/domain/api_client/movie_api_client.dart';
import 'package:kinoshka/domain/services/movie_service.dart';
import 'package:kinoshka/entity/movie.dart';
import 'package:kinoshka/library/paginator.dart';
import 'package:kinoshka/library/widgets/localized_model_storage.dart';
import 'package:kinoshka/navigation/main_navigation.dart';

class MovieTopListRowData {
  final int id;
  final String title;
  final String? posterPath;
  final String releaseDate;
  final String overview;
  final String voteAverage;

  MovieTopListRowData({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
  });
}

class MovieTopListViewModel extends ChangeNotifier {
  final _movieService = MovieService();
  late Paginator<Movie> _popularMoviesPaginator;
  late Paginator<Movie> _searchMoviesPaginator;
  var _movies = <MovieTopListRowData>[];

  List<MovieTopListRowData> get movies => List.unmodifiable(_movies);
  late DateFormat _dateFormat;
  final _localizedModelStorage = LocalizedModelStorage();
  String? _searchQuery;
  Timer? searchDebounce;

  MovieTopListViewModel() {
    _popularMoviesPaginator = Paginator<Movie>((page) async {
      final result = await _movieService.getPopularMovie(page, _localizedModelStorage.localeTag);
      return PaginatorLoadResult(
          data: result.movies,
          currentPage: result.page,
          totalPages: result.totalPages);
    });
    _searchMoviesPaginator = Paginator<Movie>((page) async {
      final result =
          await _movieService.getSearchMovie(page, _localizedModelStorage.localeTag, _searchQuery ?? '');
      return PaginatorLoadResult(
          data: result.movies,
          currentPage: result.page,
          totalPages: result.totalPages);
    });
  }

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  bool get isSearchMode {
    final query = _searchQuery;
    return query != null && query.isNotEmpty;
  }

  Future<void> setLocale(Locale locale) async {
    if(!_localizedModelStorage.updateLocale(locale)) return;
    _dateFormat = DateFormat.yMMMMd(_localizedModelStorage.localeTag);
    await resetList();
  }

  Future<void> resetList() async {
    await _popularMoviesPaginator.resetList();
    await _searchMoviesPaginator.resetList();
    _movies.clear();
    await _loadNextPage();
  }

  Future<void> _loadNextPage() async {
    if (isSearchMode) {
      await _searchMoviesPaginator.loadNextPage();
      _movies = _searchMoviesPaginator.data.map(_makeRowData).toList();
    } else {
      await _popularMoviesPaginator.loadNextPage();
      _movies = _popularMoviesPaginator.data.map(_makeRowData).toList();
    }
    notifyListeners();
  }

  Future<void> showedMovieAtIndex(int index) async {
    if (index < _movies.length - 1) return;
    _loadNextPage();
  }

  void selectMovie(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.movieScreen, arguments: id);
  }

  Future<void> searchMovies(String text) async {
    final searchQuery = text.isNotEmpty ? text : null;
    if (_searchQuery == searchQuery) return;
    searchDebounce?.cancel();

    searchDebounce = Timer(const Duration(milliseconds: 500), () async {
      _movies.clear();

      _searchQuery = searchQuery;
      if (isSearchMode) {
        await _searchMoviesPaginator.resetList();
      }
      _loadNextPage();
    });
  }

  MovieTopListRowData _makeRowData(Movie movie) {
    final releaseDate = stringFromDate(movie.releaseDate);
    return MovieTopListRowData(
      id: movie.id,
      title: movie.title,
      overview: movie.overview,
      posterPath: movie.posterPath,
      releaseDate: releaseDate,
      voteAverage: movie.voteAverage.toString(),
    );
  }
}
