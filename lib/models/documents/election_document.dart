import 'package:json_annotation/json_annotation.dart';

part 'election_document.g.dart';

@JsonSerializable()
class ElectionDocument {
  int? id;
  String? document_name;
  String? document_type;
  String? url;
  int? reference;

  ElectionDocument();

  factory ElectionDocument.fromJson(Map<String, dynamic> json) =>
      _$ElectionDocumentFromJson(json);
  Map<String, dynamic> toJson() => _$ElectionDocumentToJson(this);
}
