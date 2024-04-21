import 'package:kinoshka/entity/url_info.dart';

class CollectionList{
  String name;
  String updatedAt;
  String createddAt;
  String? category;
  String? slug;
  int? moviesCount;
  UrlInfo? cover;

  CollectionList(
      {required this.name,
      required this.updatedAt,
      required this.createddAt,
      this.category,
      this.slug,
      this.moviesCount,
      this.cover});
}
