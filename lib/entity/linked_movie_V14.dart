import 'package:kinoshka/entity/rating.dart';
import 'package:kinoshka/entity/url_info.dart';

class LinkedMovieV14 {
 int id;
 String? name;
 String? enName;
 String? alternativeName;
 String? type;
 UrlInfo? poster;
 Rating? rating;
 int? year;

 LinkedMovieV14(
      {required this.id,
      this.name,
      this.enName,
      this.alternativeName,
      this.type,
      this.poster,
      this.rating,
      this.year});
}