// GENERATED CODE - DO NOT MODIFY BY HAND(MORE THAN IT ALREADY IS. LARGE AND
// THUMB URLS ARE MANUALLY EXTRACTED!!!!!!)

part of 'imageFile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageFile _$ImageFileFromJson(Map<String, dynamic> json) {
  return ImageFile()
    ..url = json['url'] as String?
    ..large = json['large']['url'] as String?
    ..thumb = json['thumb']['url'] as String?;
}

Map<String, dynamic> _$ImageFileToJson(ImageFile instance) => <String, dynamic>{
      'url': instance.url,
      'large': instance.large,
      'thumb': instance.thumb,
    };
