import 'package:kinoshka/domain/api_client/account_api_client.dart';
import 'package:kinoshka/domain/api_client/auth_api_client.dart';
import 'package:kinoshka/domain/data/session_data.dart';

class AuthService {
  final _sessionData = SessionData();
  final _authApiClient = AuthApiClient();
  final _accountApiClient = AccountApiClient();

  Future<bool> isAuth() async {
    final sessionId = await _sessionData.getSessionId();
    final isAuth = sessionId != null;
    return isAuth;
  }

  Future<void> login(String login, String password) async {
    final sessionId = await _authApiClient.auth(userName: login, password: password);
    final accountId = await _accountApiClient.getAccountDetails(sessionId!);

    await _sessionData.setSessionId(sessionId);
    await _sessionData.setAccountId(accountId);
  }

  Future<void> logOut() async {
    await _sessionData.deleteSessionId();
    await _sessionData.deleteAccountId();
  }
}
