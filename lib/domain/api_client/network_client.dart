import 'dart:convert';
import 'dart:io';

import 'package:kinoshka/domain/api_client/api_exception.dart';

class NetworkClient{
  final _client = HttpClient();

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse(path);
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<T> get<T>(String path, T Function(dynamic json) parser,
      [Map<String, dynamic>? parameters]) async {
    Uri url;
    if (parameters != null && parameters.isNotEmpty) {
      url = _makeUri(path, parameters);
    } else {
      url = _makeUri(path);
    }

    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);

      final result = parser(json);
      return result;
    } on SocketException catch (_) {
      throw ApiClientException(type: ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      print(e);
      throw ApiClientException(type: ApiClientExceptionType.other);
    }
  }

  Future<T> post<T>(String path, Map<String, dynamic>? bodyParameters,
      T Function(dynamic json) parser,
      [Map<String, dynamic>? urlParameters]) async {
    final url = _makeUri(path, urlParameters);

    try {
      final request = await _client.postUrl(url);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(bodyParameters));
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);

      final result = parser(json);
      return result;
    } on SocketException catch (_) {
      throw ApiClientException(type: ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(type: ApiClientExceptionType.other);
    }
  }

  void _validateResponse(HttpClientResponse response, dynamic json) {
    if (response.statusCode == 401) {
      final status = json['status_code'];
      final code = status is int ? status : 0;
      if (code == 30) {
        throw ApiClientException(type: ApiClientExceptionType.auth);
      } else if (code == 3) {
        throw ApiClientException(type: ApiClientExceptionType.sessionExpired);
      } else {
        throw ApiClientException(type: ApiClientExceptionType.other);
      }
    }
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => json.decode(v));
  }
}