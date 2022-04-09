import 'package:json_annotation/json_annotation.dart';

part 'notis.g.dart'; 

@JsonSerializable()
class Notis {
  int? id; 
  DateTime? created_at; 
  bool? seen; 
  bool? visited;
  Map<String, String?>? data;
  int? event_id;

  Notis();

  factory Notis.fromJson(Map<String, dynamic> json) => _$NotisFromJson(json); 

  Map<String, dynamic> toJson() => _$NotisToJson(this);  
}