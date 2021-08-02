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
        .toList();
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
    };
