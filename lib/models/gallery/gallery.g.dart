// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gallery _$GalleryFromJson(Map<String, dynamic> json) {
  return Gallery()
    ..id = json['id'] as int?
    ..start_date = json['start_date'] == null
        ? null
        : DateTime.parse(json['start_date'] as String)
    ..location = json['location'] as String?
    ..image_count = json['image_count'] as int?
    ..thumb = json['thumb'] as String?
    ..years = (json['years'] as List<dynamic>?)?.map((e) => e as int).toList()
    ..Title = json['Title'] as String?;
}

Map<String, dynamic> _$GalleryToJson(Gallery instance) => <String, dynamic>{
      'id': instance.id,
      'start_date': instance.start_date?.toIso8601String(),
      'location': instance.location,
      'image_count': instance.image_count,
      'thumb': instance.thumb,
      'years': instance.years,
      'Title': instance.Title,
    };
