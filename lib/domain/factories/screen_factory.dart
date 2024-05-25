import 'package:flutter/material.dart';
import 'package:kinoshka/screens/auth_screen/auth_screen.dart';
import 'package:kinoshka/screens/auth_screen/auth_screen_view_model.dart';
import 'package:kinoshka/screens/loader_screen/loader_screen.dart';
import 'package:kinoshka/screens/loader_screen/loader_screen_model.dart';
import 'package:kinoshka/screens/main_screen/main_screen.dart';
import 'package:kinoshka/screens/movie_list_Widget/movie_top_list_widget.dart';
import 'package:kinoshka/screens/movie_list_Widget/movie_top_list_view_model.dart';
import 'package:kinoshka/screens/movie_screen/movie_details_screen.dart';
import 'package:kinoshka/screens/movie_screen/movie_details_screen_model.dart';
import 'package:kinoshka/screens/movie_trailer/movie_trailer_screen.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderScreenModel(context),
      lazy: false,
      child: const LoaderScreen(),
    );
  }

  Widget makeAuth() {
    return ChangeNotifierProvider(
      create: (_) => AuthScreenViewModel(),
      child: const AuthScreen(),
    );
  }

  Widget makeMain() {
    return const MainScreen();
  }

  Widget makeTopList() {
    return ChangeNotifierProvider(
      create: (_) => MovieTopListViewModel(),
      child: const MoviesTopListWidget(),
    );
  }

  Widget makeMovieDetails(int movieId) {
    return ChangeNotifierProvider(
      create: (_) => MovieDetailsScreenModel(movieId),
      child: const MovieDetailsScreen(),
    );
  }

  Widget makeMovieTrailer(String youtubeKey) {
    return MovieTrailerScreen(youtubeKey: youtubeKey);
  }

  Widget makeDefault() {
    const widget = Text('Navigation error');
    return widget;
  }

  Widget makeFilmsList(){
    return const Center(child: Text('Фильмы'));
  }

  Widget makeSerialsList(){
    return const Center(child: Text('Сериалы'));
  }
}
