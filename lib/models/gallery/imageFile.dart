//LARGE AND THUMB ARE ACTUALLY JSON OBJECTS BUT RELEVANT FEILDS ARE MANUALLY
//EXTRACTED IN .g FILE. BE CAREFULL WHILE TAMPERING!!

part 'imageFile.g.dart';

class ImageFile {
  String? url;
  String? large;
  String? thumb;

  ImageFile();

  factory ImageFile.fromJson(Map<String, dynamic> json) =>
      _ImageFileFromJson(json);

  Map<String, dynamic> toJson() => _ImageFileToJson(this);
}
