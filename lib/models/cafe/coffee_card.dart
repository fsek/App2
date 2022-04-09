import 'package:json_annotation/json_annotation.dart';
import 'coffeecarduser.dart';

part 'coffecard.g.dart';

@JsonSerializable()
class CoffeCard {
  int? id;
  int? available_coffees;
  CoffeeCardUser? user;

  CoffeCard();

  factory CoffeeCard.fromJson(Map<String, dynamic> json) =>
      _$CoffeeCardFromJson(json);

  Map<String, dynamic> toJson() => _$CoffeeCardToJson(this);
}
