import 'package:json_annotation/json_annotation.dart';
import 'fruituser.dart';

part 'fruit.g.dart';

@JsonSerializable()
class Fruit {
  int? id;
  String? name;
  bool? is_moldy;
  FruitUser? user;

  Fruit();

  factory Fruit.fromJson(Map<String, dynamic> json) => _$FruitFromJson(json);

  Map<String, dynamic> toJson() => _$FruitToJson(this);
}
