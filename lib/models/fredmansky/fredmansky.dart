import 'package:json_annotation/json_annotation.dart';

part 'fredmansky.g.dart';

@JsonSerializable()
class Fredmansky {
  bool? enabled;

  Fredmansky();

  factory Fredmansky.fromJson(Map<String, dynamic> json) =>
      _$FredmanskyFromJson(json);
  Map<String, dynamic> toJson() => _$FredmanskyToJson(this);
}
