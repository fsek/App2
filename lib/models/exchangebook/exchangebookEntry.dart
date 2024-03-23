import 'package:json_annotation/json_annotation.dart';

part 'exchangebookEntry.g.dart';

@JsonSerializable()
class BookEntry {
  int? id;
  int? price;
  String? title;
  String? user;

  BookEntry();

  factory BookEntry.fromJson(Map<String, dynamic> json) =>
      _$BookEntryFromJson(json);
  Map<String, dynamic> toJson() => _$BookEntryToJson(this);
}
