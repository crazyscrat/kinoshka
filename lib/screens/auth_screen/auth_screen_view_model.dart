import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kinoshka/domain/api_client/api_exception.dart';
import 'package:kinoshka/domain/services/auth_service.dart';
import 'package:kinoshka/navigation/main_navigation.dart';

class AuthScreenViewModel extends ChangeNotifier {
  final _authService = AuthService();

  final TextEditingController loginTextController =
      TextEditingController();
  final TextEditingController passwordTextController =
      TextEditingController();

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;

  bool get canStartAuth => !_isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty) {
      _updateState('Заполните логин и пароль', false);
      return;
    }

    _updateState(null, true);

    _errorMessage = await _login(login, password);

    if (_errorMessage == null) {
      FocusManager.instance.primaryFocus?.unfocus();
      MainNavigation.resetNavigation(context);
    } else {
      _updateState(_errorMessage, false);
    }
  }

  Future<String?> _login(String login, String password) async {
    try {
      await _authService.login(login, password);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          return 'Сервер недоступен! Проверьте подключение.';
        case ApiClientExceptionType.auth:
          return 'Неверный логин/пароль!';
        case ApiClientExceptionType.other:
          return 'Произошла ошибка, попробуйте позже.';
        default:
          return e.toString();
      }
    } catch (e) {
      return 'Неизвестная ошибка, повторите попытку!';
    }

    return null;
  }

  void _updateState(String? errorMessage, bool isAuthProgress) {
    if (_errorMessage == errorMessage && _isAuthProgress == isAuthProgress)
      return;

    _errorMessage = errorMessage;
    _isAuthProgress = isAuthProgress;
    notifyListeners();
  }

  void reset() {}
}
