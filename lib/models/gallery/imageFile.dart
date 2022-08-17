//this is well made and cool
import 'package:json_annotation/json_annotation.dart';


part 'imageFile.g.dart';
@JsonSerializable()
class ImageFile {
  String? url;
  // String? large;
  // String? thumb;
  Map<String, String>? large;
  Map<String, String>? thumb;
  
  ImageFile();

  factory ImageFile.fromJson(Map<String, dynamic> json) =>
      _$ImageFileFromJson(json);

  Map<String, dynamic> toJson() => _$ImageFileToJson(this);
}
