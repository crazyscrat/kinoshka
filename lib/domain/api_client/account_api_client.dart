import 'package:kinoshka/domain/api_client/network_client.dart';
import 'package:kinoshka/settings/settings_const.dart';

class AccountApiClient{
  final _networkClient = NetworkClient();

  Future<int> getAccountDetails(String sessionId) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = jsonMap['id'] as int;
      return response;
    }

    final result = await _networkClient.get(SettingConst.host + SettingConst.account, parser, {
      'session_id': sessionId,
      'api_key': SettingConst.apiKey,
    });
    return result;
  }

  Future<int?> setFavorite(
      {required String sessionId,
        required int accountId,
        required MediaType mediaType,
        required int mediaTd,
        required bool favorite}) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final statusCode = jsonMap['status_code'] as int;
      return statusCode;
    }

    final parameters = <String, dynamic>{
      "media_type": mediaType.name,
      "media_id": mediaTd,
      "favorite": favorite
    };
    final result = _networkClient.post(
        '${SettingConst.host}${SettingConst.account}/$accountId${SettingConst.favorite}',
        parameters,
        parser, {
      'api_key': SettingConst.apiKey,
      'session_id': sessionId,
    });
    return result;
  }
}


enum MediaType { movie, tv }