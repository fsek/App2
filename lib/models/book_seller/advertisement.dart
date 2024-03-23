import 'package:json_annotation/json_annotation.dart';

part 'advertisement.g.dart';

@JsonSerializable()
class Advertisement {
  int? ad_id;
  String? title;
  String? course;
  String? author;
  String? seller;
  int? condition;
  int? price;
  bool? selling;

  Advertisement();

  factory Advertisement.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementFromJson(json);
  Map<String, dynamic> toJson() => _$AdvertisementToJson(this);
}
