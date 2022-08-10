import 'package:fsek_mobile/models/gallery/imageFile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart'; 

@JsonSerializable()
class Contact {
  int? id; 
  String? email; 
  String? name;
  String? text; 
  List<String>? users;
  Map<String, Map<String, dynamic>>? avatar;

  Contact();

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this); 

}

