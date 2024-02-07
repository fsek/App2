import 'package:fsek_mobile/models/documents/document_collection.dart';
import 'package:fsek_mobile/models/documents/election_document.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class DocumentService extends AbstractService {
  Future<List<DocumentCollection>> getDocumentCollections() async {
    Map json = await AbstractService.get("/document_collections");
    return (json['document_collections'] as List)
        .map((data) => DocumentCollection.fromJson(data))
        .toList();
  }

  Future<DocumentCollection?> getDocumentCollection(String name) async {
    List<DocumentCollection> docCollections = await getDocumentCollections();
    int? id = idFromCollectionName(docCollections, name);
    if (id == null) {
      return null;
    }
    Map json = await AbstractService.get("/document_collections/$id");
    return DocumentCollection.fromJson(
        json["document_collection"] as Map<String, dynamic>,);
  }

  int? idFromCollectionName(List<DocumentCollection> collections, String name) {
    for (DocumentCollection collection in collections) {
      if (collection.collection_name == name) {
        return collection.id;
      }
    }
    return null;
  }

  Future<List<ElectionDocument>?> getPropositions(String collectionName) async {
    DocumentCollection? docCollection =
        await getDocumentCollection(collectionName);
    if (docCollection == null) {
      return null;
    } else if (docCollection.election_documents == null) {
      return [];
    }
    return docCollection.election_documents!
        .where((document) => document.document_type == "proposition")
        .toList();
  }

  Future<List<List<ElectionDocument?>>?> getMotionsAndAnswers(
      String collectionName,) async {
    // returns a list of motion and motion-answer pairs (where motion-answers might not exist)
    DocumentCollection? docCollection =
        await getDocumentCollection(collectionName);
    if (docCollection == null) {
      return null;
    } else if (docCollection.election_documents == null) {
      return [];
    }
    List<ElectionDocument> motions = docCollection.election_documents!
        .where((document) => document.document_type == "motion")
        .toList();
    List<ElectionDocument> answers = docCollection.election_documents!
        .where((document) => document.document_type == "motionssvar")
        .toList();
    List<List<ElectionDocument?>> motionsAndAnswers = [];
    for (ElectionDocument motion in motions) {
      ElectionDocument? ans;
      for (ElectionDocument answer in answers) {
        if (motion.id == answer.reference) {
          ans = answer;
          break;
        }
      }
      motionsAndAnswers.add([motion, ans]);
    }
    return motionsAndAnswers;
  }

  Future<List<ElectionDocument>?> getOthers(String collectionName) async {
    DocumentCollection? docCollection =
        await getDocumentCollection(collectionName);
    if (docCollection == null) {
      return null;
    } else if (docCollection.election_documents == null) {
      return [];
    }
    return docCollection.election_documents!
        .where((document) => document.document_type == "övrig")
        .toList();
  }
}
