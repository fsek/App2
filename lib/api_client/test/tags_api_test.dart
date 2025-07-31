import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for TagsApi
void main() {
  final instance = ApiClient().getTagsApi();

  group(TagsApi, () {
    // Delete Tag
    //
    //Future<TagRead> tagsDeleteTag(int tagId) async
    test('test tagsDeleteTag', () async {
      // TODO
    });

    // Edit Tag
    //
    //Future<TagRead> tagsEditTag(TagEdit tagEdit) async
    test('test tagsEditTag', () async {
      // TODO
    });

    // Get Tags
    //
    //Future<BuiltList<TagRead>> tagsGetTags() async
    test('test tagsGetTags', () async {
      // TODO
    });

    // Post Tag
    //
    //Future<TagRead> tagsPostTag(TagCreate tagCreate) async
    test('test tagsPostTag', () async {
      // TODO
    });

  });
}
