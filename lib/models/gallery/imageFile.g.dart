// GENERATED CODE - DO NOT MODIFY BY HAND(MORE THAN IT ALREADY IS. LARGE AND
// THUMB URLS ARE MANUALLY EXTRACTED!!!!!!)

part of 'imageFile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
ImageFile _ImageFileFromJson(Map<String, dynamic> json) {
  return ImageFile()
    ..url = json['url'] as String?
    ..large = json['large']['url'] as String?
    ..thumb = json['thumb']['url'] as String?;
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _ImageFileToJson(ImageFile instance) => <String, dynamic>{
      'url': instance.url,
      'large': instance.large,
      'thumb': instance.thumb,
    };