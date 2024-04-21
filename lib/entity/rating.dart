import 'dart:ffi';

class Rating{
  double? kp;
  double? imdb;
  double? tmdb;
  double? filmCritics;
  double? russianFilmCritics;
  double? await;

  Rating(
      {this.kp,
      this.imdb,
      this.tmdb,
      this.filmCritics,
      this.russianFilmCritics,
      this.await});
}