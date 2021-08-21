// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News()
    ..id = json['id'] as int?
    ..title = json['title'] as String?
    ..content = json['content'] as String?
    ..created_at = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..image = json['image'] as String?
    ..categories = (json['categories'] as List<dynamic>?)
        ?.map((e) => e as Map<String, dynamic>?)
        .toList()
    ..user = json['user'] == null
        ? null
        : NewsUser.fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'created_at': instance.created_at?.toIso8601String(),
      'image': instance.image,
      'categories': instance.categories,
      'user': instance.user,
    };
