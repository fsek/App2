import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for PostsApi
void main() {
  final instance = ApiClient().getPostsApi();

  group(PostsApi, () {
    // Create Post
    //
    //Future<PostRead> postsCreatePost(PostCreate postCreate) async
    test('test postsCreatePost', () async {
      // TODO
    });

    // Delete Post
    //
    //Future postsDeletePost(int postId) async
    test('test postsDeletePost', () async {
      // TODO
    });

    // Get All Posts
    //
    //Future<BuiltList<PostRead>> postsGetAllPosts() async
    test('test postsGetAllPosts', () async {
      // TODO
    });

    // Update Post
    //
    //Future<PostRead> postsUpdatePost(int postId, PostUpdate postUpdate) async
    test('test postsUpdatePost', () async {
      // TODO
    });

  });
}
