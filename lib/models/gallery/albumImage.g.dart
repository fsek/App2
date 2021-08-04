// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albumImage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumImage _$AlbumImageFromJson(Map<String, dynamic> json) {
  return AlbumImage()
    ..id = json['id'] as int?
    ..album_id = json['album_id'] as int?
    ..created_at = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updated_at = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..file = json['file'] == null
        ? null
        : ImageFile.fromJson(json['file'] as Map<String, dynamic>)
    ..filename = json['filename'] as String?
    ..photographer_id = json['photographer_id'] as int?
    ..photographer_name = json['photographer_name'] as String?
    ..width = json['width'] as int?
    ..height = json['height'] as int?
    ..file_tmp = json['file_tmp'] as String?;
}

Map<String, dynamic> _$AlbumImageToJson(AlbumImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'album_id': instance.album_id,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'file': instance.file,
      'filename': instance.filename,
      'photographer_id': instance.photographer_id,
      'photographer_name': instance.photographer_name,
      'width': instance.width,
      'height': instance.height,
      'file_tmp': instance.file_tmp,
    };
