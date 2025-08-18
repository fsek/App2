import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for NewsApi
void main() {
  final instance = ApiClient().getNewsApi();

  group(NewsApi, () {
    // Bump News
    //
    //Future<NewsRead> newsBumpNews(int newsId) async
    test('test newsBumpNews', () async {
      // TODO
    });

    // Create News
    //
    //Future<NewsRead> newsCreateNews(NewsCreate newsCreate) async
    test('test newsCreateNews', () async {
      // TODO
    });

    // Delete News
    //
    //Future newsDeleteNews(int newsId) async
    test('test newsDeleteNews', () async {
      // TODO
    });

    // Get All News
    //
    //Future<BuiltList<NewsRead>> newsGetAllNews() async
    test('test newsGetAllNews', () async {
      // TODO
    });

    // Get News
    //
    //Future<NewsRead> newsGetNews(int newsId) async
    test('test newsGetNews', () async {
      // TODO
    });

    // Get Paginated News
    //
    //Future<BuiltList<NewsRead>> newsGetPaginatedNews(int pageNbr) async
    test('test newsGetPaginatedNews', () async {
      // TODO
    });

    // Update News
    //
    //Future<NewsRead> newsUpdateNews(int newsId, NewsUpdate newsUpdate) async
    test('test newsUpdateNews', () async {
      // TODO
    });

  });
}
