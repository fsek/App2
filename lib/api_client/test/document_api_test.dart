import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for DocumentApi
void main() {
  final instance = ApiClient().getDocumentApi();

  group(DocumentApi, () {
    // Delete Document
    //
    //Future<DocumentRead> documentDeleteDocument(int documentId) async
    test('test documentDeleteDocument', () async {
      // TODO
    });

    // Get All Documents
    //
    //Future<BuiltList<DocumentRead>> documentGetAllDocuments() async
    test('test documentGetAllDocuments', () async {
      // TODO
    });

    // Get Document Data By Id
    //
    //Future<DocumentRead> documentGetDocumentDataById(int documentId) async
    test('test documentGetDocumentDataById', () async {
      // TODO
    });

    // Get Document File By Id
    //
    //Future<JsonObject> documentGetDocumentFileById(int documentId) async
    test('test documentGetDocumentFileById', () async {
      // TODO
    });

    // Update Document
    //
    //Future<DocumentRead> documentUpdateDocument(int documentId, DocumentUpdate documentUpdate) async
    test('test documentUpdateDocument', () async {
      // TODO
    });

    // Upload Document
    //
    //Future<DocumentRead> documentUploadDocument(MultipartFile file, String title, String category, bool isPrivate) async
    test('test documentUploadDocument', () async {
      // TODO
    });

  });
}
