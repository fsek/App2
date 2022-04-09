import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart'; 

@JsonSerializable()
class Song {
  int? id; 
  String? title; 
  String? author; 
  String? melody;
  String? content;

  Song();

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json); 

  Map<String, dynamic> toJson() => _$SongToJson(this);  
}