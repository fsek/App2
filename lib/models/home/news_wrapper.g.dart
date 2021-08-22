// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsWrapper _$NewsWrapperFromJson(Map<String, dynamic> json) {
  return NewsWrapper()
    ..news = (json['news'] as List<dynamic>?)
        ?.map((e) => News.fromJson(e as Map<String, dynamic>))
        .toList()
    ..meta = json['meta'] == null
        ? null
        : NotisMeta.fromJson(json['meta'] as Map<String, dynamic>);
}

Map<String, dynamic> _$NewsWrapperToJson(NewsWrapper instance) =>
    <String, dynamic>{
      'news': instance.news,
      'meta': instance.meta,
    };
