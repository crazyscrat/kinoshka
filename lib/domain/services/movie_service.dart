import 'package:kinoshka/domain/api_client/account_api_client.dart';
import 'package:kinoshka/domain/api_client/movie_api_client.dart';
import 'package:kinoshka/domain/data/session_data.dart';
import 'package:kinoshka/entity/actor_images.dart';
import 'package:kinoshka/entity/local_entity/movie_details_local.dart';
import 'package:kinoshka/entity/popular_movie_response.dart';
import 'package:kinoshka/settings/settings_const.dart';

class MovieService {
  final _movieApiClient = MovieApiClient();
  final _apiClient = MovieApiClient();
  final _accountApiClient = AccountApiClient();
  final _sessionData = SessionData();

  Future<PopularMovieResponse> getPopularMovie(int page, String locale) async =>
      _movieApiClient.getPopularMovie(page, locale, SettingConst.apiKey);

  Future<PopularMovieResponse> getSearchMovie(
          int page, String locale, String query) async =>
      _movieApiClient.getSearchMovie(page, locale, query, SettingConst.apiKey);

  Future<MovieDetailsLocal> loadMovieDetails({required int movieId, required String locale}) async {
    final movieDetails = await _apiClient.getMovieDetails(movieId, locale);
    final sessionData = await _sessionData.getSessionId();
    bool isFavorite = false;
    if (sessionData != null) {
      isFavorite = await _apiClient.isFavorite(movieId, sessionData);
    }

    return MovieDetailsLocal(isFavorite: isFavorite, movieDetails: movieDetails);
  }

  Future<void> toggleFavorite({required int movieId, required bool isFavorite}) async {
    final sessionId = await _sessionData.getSessionId();
    final accountId = await _sessionData.getAccountId();

    if(sessionId == null || accountId == null) return;

    await _accountApiClient.setFavorite(
      sessionId: sessionId,
      accountId: accountId,
      mediaType: MediaType.movie,
      mediaTd: movieId,
      favorite: !isFavorite,
    );
  }

  Future<ActorImages> loadActorImages(
      {required int actorId, required String locale}) async {
    final actorImages = await _apiClient.getActorImages(actorId, locale);
    return actorImages;
  }
}
