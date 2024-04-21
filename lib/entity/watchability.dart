import 'package:kinoshka/entity/url_info.dart';

class WatchabilityItem{
  String? name;
  Logo logo;
  String? url;

  WatchabilityItem({this.name, required this.logo, this.url});
}

class Watchability {
  List<WatchabilityItem>? items;

  Watchability({this.items});
}