import 'package:json_annotation/json_annotation.dart';

part 'gallery.g.dart';

@JsonSerializable()
class Gallery {
  int? id;
  DateTime? start_date;
  String? location;
  int? image_count;
  String? thumb;
  List<int>? years;
  String? Title;

  Gallery();

  factory Gallery.fromJson(Map<String, dynamic> json) =>
      _$GalleryFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryToJson(this);
}
