import 'package:flutter/material.dart';
import 'package:kinoshka/domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderScreen = '/';
  static const auth = '/auth';
  static const mainScreen = '/main';
  static const movieScreen = '/main/movie';
  static const trailerScreen = '/main/movie/trailer';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = {
    MainNavigationRouteNames.loaderScreen: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMain(),
    MainNavigationRouteNames.auth: (_) => _screenFactory.makeAuth(),
  };

  static Route<Object>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieScreen:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(builder: (_) =>_screenFactory.makeMovieDetails(movieId));
      case MainNavigationRouteNames.trailerScreen:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(builder: (_) => _screenFactory.makeMovieTrailer(youtubeKey));
      default:
        return MaterialPageRoute(builder: (_) => _screenFactory.makeDefault());
    }
  }

  static void resetNavigation(BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil(MainNavigationRouteNames.loaderScreen, (route) => false);
  }
}
