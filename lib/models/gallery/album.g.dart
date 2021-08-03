// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album()
    ..id = json['id'] as int?
    ..images = (json['images'] as List<dynamic>?)
        ?.map((e) => AlbumImage.fromJson(e as Map<String, dynamic>))
        .toList()
    ..photographers = (json['photographers'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..title = json['title'] as String?
    ..description = json['description'] as String?;
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'photographers': instance.photographers,
      'title': instance.title,
      'description': instance.description,
    };
