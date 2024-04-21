class Video{
  String? url;
  String? name;
  String? site;
  int? size;
  String? type;

  Video({this.url, this.name, this.site, this.size, this.type});
}

class VideoTypes{
  List<Video>? trailers;

  VideoTypes({this.trailers});
}