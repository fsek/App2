import 'package:json_annotation/json_annotation.dart';

import 'notis.dart';
import 'notis_meta.dart';

part 'notis_wrapper.g.dart'; 

@JsonSerializable()
class NotisWrapper {
  List<Notis>? notifications;
  NotisMeta? meta;

  NotisWrapper();

  factory NotisWrapper.fromJson(Map<String, dynamic> json) => _$NotisWrapperFromJson(json); 

  Map<String, dynamic> toJson() => _$NotisWrapperToJson(this);  
}