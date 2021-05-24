import 'dart:convert';

class ModelNewsArticle {
  String title;
  String publishedAt;
  String description;
  String url;
  String urlToImage;
  ModelNewsArticle({
    this.title,
    this.publishedAt,
    this.description,
    this.url,
    this.urlToImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'publishedAt': publishedAt,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
    };
  }

  factory ModelNewsArticle.fromMap(Map<String, dynamic> json) {
    return ModelNewsArticle(
      title: json['title'],
      publishedAt: json['publishedAt'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelNewsArticle.fromJson(String source) =>
      ModelNewsArticle.fromMap(json.decode(source));
}
