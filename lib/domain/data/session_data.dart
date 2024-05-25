import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const sessionId = 'session_id';
  static const accountId = 'account_id';
  static const login = 'login';
  static const password = 'password';
}

class SessionData {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getSessionId() async {
    return await _secureStorage.read(key: _Keys.sessionId);
  }

  Future<void> setSessionId(String value) async {
    await _secureStorage.write(key: _Keys.sessionId, value: value);
  }

  Future<void> deleteSessionId() async {
    _secureStorage.delete(key: _Keys.sessionId);
  }

  Future<String?> getLogin() async {
    return await _secureStorage.read(key: _Keys.login);
  }

  Future<void> setLogin(String? value) async {
    if (value != null) {
      await _secureStorage.write(key: _Keys.login, value: value);
    } else {
      _secureStorage.delete(key: _Keys.login);
    }
  }

  Future<String?> getPassword() async {
    return await _secureStorage.read(key: _Keys.password);
  }

  Future<void> setPassword(String? value) async {
    if (value != null) {
      await _secureStorage.write(key: _Keys.password, value: value);
    } else {
      _secureStorage.delete(key: _Keys.password);
    }
  }

  Future<int?> getAccountId() async {
    final id = await _secureStorage.read(key: _Keys.accountId);
    if (id != null) {
      return int.tryParse(id);
    }
    return null;
  }

  Future<void> setAccountId(int value) async {
    await _secureStorage.write(key: _Keys.accountId, value: value.toString());
  }

  Future<void> deleteAccountId() async {
    _secureStorage.delete(key: _Keys.accountId);
  }
}
