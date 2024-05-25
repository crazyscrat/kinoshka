import 'package:kinoshka/entity/movie.dart';

abstract class Tests {

  static final Movie movie = Movie(
      adult: false,
      backdropPath: '/qrGtVFxaD8c7et0jUtaYhyTzzPg.jpg',
      id: 823464,
      originalLanguage: 'en',
      originalTitle: 'Godzilla x Kong: The New Empire',
      overview: 'После своей бурной схватки Годзилла и Конг должны объединиться против колоссальной нераскрытой угрозы, скрытой в нашем мире, бросающей вызов самому их существованию – и нашему собственному.',
      popularity: 2372.572,
      posterPath: '/q1aUvQflQ4oYPkxrodmzOQgNfBJ.jpg',
      releaseDate: DateTime(2024, DateTime.march, 27),
      title: 'Годзилла и Конг: Новая Империя',
      video: false,
      voteAverage: 6.644,
      voteCount: 789,
      genreIds: [
        28,
        878,
        12
      ]);
}
