import 'package:flutter/material.dart';
import 'package:kinoshka/domain/services/auth_service.dart';
import 'package:kinoshka/navigation/main_navigation.dart';

class LoaderScreenModel{
  final _authService = AuthService();
  final BuildContext context;

  LoaderScreenModel(this.context){
    asyncInit();
  }

  Future<void> asyncInit() async{
    await checkAuth();
  }

  Future<void> checkAuth() async{
    final isAuth = await _authService.isAuth();
    final nextScreen = isAuth ?
      MainNavigationRouteNames.mainScreen :
      MainNavigationRouteNames.auth;

    Navigator.of(context).pushReplacementNamed(nextScreen);
  }
}