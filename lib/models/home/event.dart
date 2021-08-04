import 'package:json_annotation/json_annotation.dart';

//part 'event.dart';

@JsonSerializable()
class Event {
  int? id;
  String? title;
  String? content;
  DateTime? created_at;
  String? image;
  List<String>? categories;

  Event(this.title);
  /*
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
  */
}
