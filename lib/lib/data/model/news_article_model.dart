import 'dart:convert';

List<ArticleModel> articlesFromJson(String str) => List<ArticleModel>.from(json
    .decode(str)['articles']
    .map((x) => ArticleModel.fromJson(Map<String, dynamic>.from(x))));

class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  // String? publishedAt;
  String? content;

  ArticleModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      required this.urlToImage,
      // this.publishedAt,
      this.content});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    // publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    // data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}
