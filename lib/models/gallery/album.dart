import 'package:fsek_mobile/models/gallery/albumImage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  int? id;
  List<AlbumImage>? images;
  List<String>? photographers; 
  String? title; 
  String? description; 


  Album();

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
