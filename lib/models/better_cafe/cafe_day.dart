import 'package:fsek_mobile/models/better_cafe/sandwich.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cafe_day.g.dart';

@JsonSerializable()
class CafeDay {
  List<Sandwich>? sandwiches;
  Map<String, String>? weekday;
  CafeDay();

  factory CafeDay.fromJson(Map<String, dynamic> json) =>
      _$CafeDayFromJson(json);

  Map<String, dynamic> toJson() => _$CafeDayToJson(this);
}
