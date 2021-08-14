// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songbookEntry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongbookEntry _$SongbookEntryFromJson(Map<String, dynamic> json) {
  return SongbookEntry()
    ..id = json['id'] as int?
    ..title = json['title'] as String?
    ..author = json['author'] as String?;
}

Map<String, dynamic> _$SongbookEntryToJson(SongbookEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
    };
