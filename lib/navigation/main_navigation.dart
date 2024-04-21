import 'package:flutter/material.dart';
import 'package:kinoshka/entity/search_movie_dto_v1_4.dart';
import 'package:kinoshka/screens/main_screen/main_screen.dart';
import 'package:kinoshka/screens/movie_screen/movie_screen.dart';

abstract class MainNavigationRouteNames{
  static const mainScreen = '/';
  static const movieScreen = '/movie';
  static const tasks = '/tasks';
  static const tasksForm = '/tasks/form';
}

class MainNavigation{
  final initialRoute = MainNavigationRouteNames.mainScreen;
  final routes = {
    MainNavigationRouteNames.mainScreen: (context) => const MainScreen(),
    //MainNavigationRouteNames.movieScreen: (context) => const MovieScreen(movie: movie),
    // MainNavigationRouteNames.groups: (context) => const GroupsScreen(),
    // MainNavigationRouteNames.groupsForm: (context) => const GroupsFormScreen(),
  };

  static Route<Object>? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case MainNavigationRouteNames.movieScreen:
        final movie = settings.arguments as SearchMovieDtoV14;
        print('arg: ${movie.name}');
        return MaterialPageRoute(builder: (context) => MovieScreen(movie: movie));
      //case MainNavigationRouteNames.tasksForm:
        // final groupKey = settings.arguments as int;
        // return MaterialPageRoute(builder: (context) => TasksFormScreen(groupKey: groupKey));
      default:
        const widget = Text('Navigation error');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}