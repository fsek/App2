import 'package:json_annotation/json_annotation.dart';

part 'sandwich.g.dart';

@JsonSerializable()
class Sandwich {
  Map<String, String>? sandwich;
  String? price;

  Sandwich();

  factory Sandwich.fromJson(Map<String, dynamic> json) =>
      _$SandwichFromJson(json);
  Map<String, dynamic> toJson() => _$SandwichToJson(this);
}
