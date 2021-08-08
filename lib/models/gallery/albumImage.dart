import 'package:json_annotation/json_annotation.dart';

import 'imageFile.dart';

part 'albumImage.g.dart';

@JsonSerializable()
class AlbumImage {
  int? id;
  // ignore: non_constant_identifier_names
  int? album_id;
  // ignore: non_constant_identifier_names
  DateTime? created_at;
  // ignore: non_constant_identifier_names
  DateTime? updated_at;
  ImageFile? file;
  String? filename;
  // ignore: non_constant_identifier_names
  int? photographer_id;
  // ignore: non_constant_identifier_names
  String? photographer_name;
  int? width;
  int? height;
  // ignore: non_constant_identifier_names
  String? file_tmp;

  AlbumImage();

  factory AlbumImage.fromJson(Map<String, dynamic> json) =>
      _$AlbumImageFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumImageToJson(this);
}
