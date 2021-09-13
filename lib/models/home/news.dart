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
  //This does not come from api but is used locally. Might (aka will) die if
  //someone tries to push a newsentity to the server. HANDLE IN SERVICE OR
  // SOMETHING BEFORE DOING (::
  bool? is_pinned;

  News();

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}