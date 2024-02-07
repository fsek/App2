import 'package:fsek_mobile/models/notiser/notis_meta.dart';
import 'package:json_annotation/json_annotation.dart';

import 'news.dart';

part 'news_wrapper.g.dart'; //generated JSON file

@JsonSerializable()
class NewsWrapper {
  List<News>? news;
  // ignore: non_constant_identifier_names
  NotisMeta? meta;

  NewsWrapper();

  factory NewsWrapper.fromJson(Map<String, dynamic> json) =>
      _$NewsWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$NewsWrapperToJson(this);
}
