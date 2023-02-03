class Articles {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  Articles(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      required this.publishedAt,
      this.content});
}
