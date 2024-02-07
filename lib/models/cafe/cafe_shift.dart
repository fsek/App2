import 'package:fsek_mobile/models/cafe/cafe_user.dart';
import 'package:fsek_mobile/models/cafe/councils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cafe_shift.g.dart'; //generated JSON file

@JsonSerializable()
class CafeShift {
  int? id;
  DateTime? start;
  String? duration;
  bool? isme;
  Councils? councils;
  String? group;
  CafeUser? user;

  CafeShift();

  factory CafeShift.fromJson(Map<String, dynamic> json) =>
      _$CafeShiftFromJson(json);
  Map<String, dynamic> toJson() => _$CafeShiftToJson(this);
}
