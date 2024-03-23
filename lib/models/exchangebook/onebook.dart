import 'package:json_annotation/json_annotation.dart';

part 'onebook.g.dart';

@JsonSerializable()
class OneBook {
  int? id;
  int? price;
  String? title;
  String? user;
  String? transaction;

  OneBook();

  factory OneBook.fromJson(Map<String, dynamic> json) =>
      _$OneBookFromJson(json);

  Map<String, dynamic> toJson() => _$OneBookToJson(this);
}
