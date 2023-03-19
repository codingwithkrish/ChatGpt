class NewsModel {
  String? newsname;
  String? tittle;
  String? description;
  String? imageurl;
  String? url;
  String? content;
  NewsModel(
      {required this.newsname,
      required this.tittle,
      required this.content,
      required this.description,
      required this.imageurl,
      required this.url});
  factory NewsModel.fromjson(Map<String, dynamic> json) {
    return NewsModel(
        newsname: json["source"]["name"],
        tittle: json["title"],
        content: json["content"],
        description: json["description"],
        imageurl: json["urlToImage"],
        url: json["url"]);
  }
}
