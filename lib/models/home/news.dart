import 'package:json_annotation/json_annotation.dart';

import 'newsuser.dart';

part 'news.g.dart'; //generated JSON file

@JsonSerializable()

class News {
  int? id;
  String? title;
  String? content;
  DateTime? created_at;
  String? image;
  List<String>? categories;
  NewsUser? user;

  News();

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}