import 'package:kinoshka/domain/api_client/network_client.dart';
import 'package:kinoshka/entity/actor_images.dart';
import 'package:kinoshka/entity/movie_details.dart';
import 'package:kinoshka/entity/popular_movie_response.dart';
import 'package:kinoshka/settings/settings_const.dart';

class MovieApiClient {
  final _networkClient = NetworkClient();

  Future<PopularMovieResponse> getPopularMovie(int page, String locale, String apiKey) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularMovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(SettingConst.host + SettingConst.moviePopular, parser, {
      'api_key': apiKey,
      'language': locale,
      'page': page.toString(),
    });
    return result;
  }

  Future<PopularMovieResponse> getSearchMovie(
      int page, String locale, String query, String apiKey) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularMovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(SettingConst.host + SettingConst.searchMovie, parser, {
      'api_key': apiKey,
      'query': query,
      'include_adult': 'true',
      'language': locale,
      'page': page.toString(),
    });
    return result;
  }

  Future<MovieDetails> getMovieDetails(int movieId, String locale) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieDetails.fromJson(jsonMap);
      return response;
    }

    final result = await _networkClient.get('${SettingConst.host}${SettingConst.movieDetails}$movieId', parser, {
      'api_key': SettingConst.apiKey,
      'append_to_response': 'credits,videos',
      'language': locale,
    });
    return result;
  }

  Future<ActorImages> getActorImages(int actorId, String locale) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = ActorImages.fromJson(jsonMap);
      return response;
    }

    final result = await _networkClient.get(
        '${SettingConst.host}${SettingConst.actorPerson}$actorId${SettingConst.actorImages}',
        parser, {
      'api_key': SettingConst.apiKey,
      'language': locale,
    });
    return result;
  }

  Future<bool> isFavorite(int movieId, String sessionId) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = jsonMap['favorite'] as bool;
      return response;
    }

    final result = await _networkClient.get(
        '${SettingConst.host}${SettingConst.movieDetails}$movieId${SettingConst.accountStates}',
        parser, {
      'api_key': SettingConst.apiKey,
      'session_id': sessionId,
    });
    return result;
  }
}


