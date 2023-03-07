import 'package:json_annotation/json_annotation.dart';

part 'sandwich.g.dart';

@JsonSerializable()
class Sandwich {
  Map<String, String>? name;
  String?
      price; //shouldn't this be an int? yes, but it being a string makes it much easier to handle when creating the menus:)

  Sandwich();

  factory Sandwich.fromJson(Map<String, dynamic> json) =>
      _$SandwichFromJson(json);

  Map<String, dynamic> toJson() => _$SandwichToJson(this);
}
