import 'package:json_annotation/json_annotation.dart';

import 'newsuser.dart';

part 'news.g.dart'; //generated JSON file

@JsonSerializable()

class News {
  int? id;
  String? title;
  String? content;
  // ignore: non_constant_identifier_names
  DateTime? created_at;
  String? image;
  List<Map<String, dynamic>?>? categories;
  NewsUser? user;

  News();

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}