import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart'; //generated JSON file

@JsonSerializable()
class Word {
  String? key;
  String? value;
  Word();

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
  Map<String, dynamic> toJson() => _$WordToJson(this);
}
