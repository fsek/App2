import 'package:json_annotation/json_annotation.dart';

part 'albumImage.g.dart';

@JsonSerializable()
class AlbumImage {
  int? id;
  int? album_id;
  DateTime? created_at;
  DateTime? updated_at;
  ImageFile? file;
  String? filename;
  int? photographer_id;
  String? Photographer_name;
  int? width;
  int? height;
  String? file_tmp;

  AlbumImage();

  factory AlbumImage.fromJson(Map<String, dynamic> json) =>
      _$AlbumImageFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumImageToJson(this);
}
