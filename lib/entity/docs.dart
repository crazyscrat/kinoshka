import 'package:kinoshka/entity/search_movie_dto_v1_4.dart';

class Docs{
  int? total;
  int? limit;
  int? page;
  int? pages;
  List<SearchMovieDtoV14>? docs;

  Docs({this.docs, this.total, this.limit, this.page, this.pages});
}