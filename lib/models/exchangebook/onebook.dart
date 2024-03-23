import 'package:json_annotation/json_annotation.dart';

part 'onebook.g.dart';

@JsonSerializable()
class OneBook {
  int? id;
  String? title;
  String? author;
  String? melody;
  String? content;

  OneBook();

  factory OneBook.fromJson(Map<String, dynamic> json) =>
      _$OneBookFromJson(json);

  Map<String, dynamic> toJson() => _$OneBookToJson(this);
}
