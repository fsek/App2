import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart'; //generated JSON file

@JsonSerializable()
class Article {
  String? image;
  Map<String, String>? title;
  Map<String, String>? preamble;
  Map<String, String>? content;
  Article();

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
