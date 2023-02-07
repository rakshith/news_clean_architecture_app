import 'package:news_clean_arch_app/features/show_news/domain/entities/articles.dart';

class ArticlesModel extends Articles {
  ArticlesModel(
      {String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt,
      String? content})
      : super(
            title: title,
            author: author,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: _getPublishedAtInDateTime(publishedAt),
            content: content);

  static _getPublishedAtInDateTime(String? publishedAt) {
    if (publishedAt == null) {
      return DateTime.now();
    } else {
      final DateTime? publishedAtInDateTimeFormat =
          DateTime.tryParse(publishedAt);

      if (publishedAtInDateTimeFormat == null) {
        return DateTime.now();
      } else {
        return publishedAtInDateTimeFormat;
      }
    }
  }

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
        title: json['title'],
        author: json['author'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content']);
  }

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}
