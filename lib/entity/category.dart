import 'package:kinoshka/entity/url_info.dart';

class Category {
  String? category;
  String name;
  String? slug;
  int? moviesCount;
  String createdAt;
  String updatedAt;
  String? id;
  UrlInfo? cover;

  Category(
      {this.category,
      required this.name,
      this.slug,
      this.moviesCount,
      this.cover,
      required this.createdAt,
      required this.updatedAt,
      this.id});
}

// class Docs {
//   List<Category> films;
//   int total;
//   int limit;
//   int page;
//   int pages;
//
//   Docs({required this.films, required this.total, required this.limit, required this.page, required this.pages});
// }


