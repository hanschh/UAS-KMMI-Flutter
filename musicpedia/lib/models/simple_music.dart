class SimpleMusic {
  String dishImage;
  String title;
  String duration;
  String links;
  String source;
  List<String> information;

  SimpleMusic(
      this.dishImage, this.title, this.duration, this.links, this.source, this.information);

  SimpleMusic.fromJson(Map<String, dynamic> json) {
    dishImage = json['dishImage'];
    title = json['title'];
    duration = json['duration'];
    links = json['links'];
    source = json['source'];
    information = json['information'].cast<String>();
  }
}
