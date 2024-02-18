import 'package:fsek_mobile/models/documents/election_document.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document_collection.g.dart';

@JsonSerializable()
class DocumentCollection {
  int? id;
  String? collection_name;
  List<ElectionDocument>? election_documents;

  DocumentCollection();

  factory DocumentCollection.fromJson(Map<String, dynamic> json) =>
      _$DocumentCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentCollectionToJson(this);
}
