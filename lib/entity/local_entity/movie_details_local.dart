import 'package:kinoshka/entity/movie_details.dart';

class MovieDetailsLocal{
  final MovieDetails movieDetails;
  final bool isFavorite;

  const MovieDetailsLocal({
    required this.movieDetails,
    required this.isFavorite,
  });
}