import 'package:kinoshka/domain/api_client/network_client.dart';
import 'package:kinoshka/settings/settings_const.dart';

class AuthApiClient {
  final _networkClient = NetworkClient();

  Future<String?> auth(
      {required String userName, required String password}) async {
    final token = await makeToken();
    final validToken = await validateUser(
      userName: userName,
      password: password,
      requestToken: token,
    );
    final sessionId = await makeSession(requestToken: validToken);
    return sessionId;
  }

  Future<String> makeToken() async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    }

    final result = _networkClient.get(SettingConst.host + SettingConst.newToken,
        parser, {'api_key': SettingConst.apiKey});
    return result;
  }

  Future<String> validateUser({
    required String userName,
    required String password,
    required String requestToken,
  }) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    }

    final parameters = <String, dynamic>{
      "username": userName,
      "password": password,
      "request_token": requestToken
    };
    final result = _networkClient.post(
        '${SettingConst.host}${SettingConst.validateWithLogin}',
        parameters,
        parser,
        {'api_key': SettingConst.apiKey});
    return result;
  }

  Future<String?> makeSession({required String requestToken}) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final sessionId = jsonMap['session_id'] as String;
      return sessionId;
    }

    final parameters = <String, dynamic>{"request_token": requestToken};
    final result = _networkClient.post(
        '${SettingConst.host}${SettingConst.makeSession}',
        parameters,
        parser,
        {'api_key': SettingConst.apiKey});
    return result;
  }
}
