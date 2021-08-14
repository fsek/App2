import 'package:json_annotation/json_annotation.dart';

part 'songbookEntry.g.dart';

@JsonSerializable()
class SongbookEntry {
  int? id; 
  String? title; 
  String? author; 

  SongbookEntry(); 

  factory SongbookEntry.fromJson(Map<String, dynamic> json) 
      => _$SongbookEntryFromJson(json);
  Map<String, dynamic> toJson() => _$SongbookEntryToJson(this);  
}