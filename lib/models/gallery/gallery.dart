import 'package:json_annotation/json_annotation.dart';

part 'gallery.g.dart';

@JsonSerializable()
class Gallery {
  int? id;
  // ignore: non_constant_identifier_names
  DateTime? start_date;
  String? location;
  // ignore: non_constant_identifier_names
  int? image_count;
  String? thumb;
  List<int>? years;
  String? title;

  Gallery();

  factory Gallery.fromJson(Map<String, dynamic> json) =>
      _$GalleryFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryToJson(this);
}
