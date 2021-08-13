// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song()
    ..id = json['id'] as int?
    ..title = json['title'] as String?
    ..author = json['author'] as String?
    ..melody = json['melody'] as String?
    ..content = json['content'] as String?;
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'melody': instance.melody,
      'content': instance.content,
    };
