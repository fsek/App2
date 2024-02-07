import 'package:json_annotation/json_annotation.dart';

part 'notis_meta.g.dart';

@JsonSerializable()
class NotisMeta {
  int? current_page;
  int? next_page;
  int? prev_page;
  int? total_pages;
  int? total_count;
  int? unread;

  NotisMeta();

  factory NotisMeta.fromJson(Map<String, dynamic> json) =>
      _$NotisMetaFromJson(json);

  Map<String, dynamic> toJson() => _$NotisMetaToJson(this);
}
