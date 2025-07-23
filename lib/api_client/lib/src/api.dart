//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:api_client/src/serializers.dart';
import 'package:api_client/src/auth/api_key_auth.dart';
import 'package:api_client/src/auth/basic_auth.dart';
import 'package:api_client/src/auth/bearer_auth.dart';
import 'package:api_client/src/auth/oauth.dart';
import 'package:api_client/src/api/ads_api.dart';
import 'package:api_client/src/api/adventure_mission_api.dart';
import 'package:api_client/src/api/albums_api.dart';
import 'package:api_client/src/api/auth_api.dart';
import 'package:api_client/src/api/cafe_api.dart';
import 'package:api_client/src/api/candidates_api.dart';
import 'package:api_client/src/api/car_blocking_api.dart';
import 'package:api_client/src/api/cars_api.dart';
import 'package:api_client/src/api/council_api.dart';
import 'package:api_client/src/api/default_api.dart';
import 'package:api_client/src/api/document_api.dart';
import 'package:api_client/src/api/elections_api.dart';
import 'package:api_client/src/api/event_signup_api.dart';
import 'package:api_client/src/api/events_api.dart';
import 'package:api_client/src/api/groups_api.dart';
import 'package:api_client/src/api/img_api.dart';
import 'package:api_client/src/api/news_api.dart';
import 'package:api_client/src/api/nollning_api.dart';
import 'package:api_client/src/api/permissions_api.dart';
import 'package:api_client/src/api/posts_api.dart';
import 'package:api_client/src/api/songs_api.dart';
import 'package:api_client/src/api/songs_category_api.dart';
import 'package:api_client/src/api/tags_api.dart';
import 'package:api_client/src/api/user_door_access_api.dart';
import 'package:api_client/src/api/users_api.dart';

class ApiClient {
  static const String basePath = r'http://10.0.2.2:8000';

  final Dio dio;
  final Serializers serializers;

  ApiClient({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get AdsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AdsApi getAdsApi() {
    return AdsApi(dio, serializers);
  }

  /// Get AdventureMissionApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AdventureMissionApi getAdventureMissionApi() {
    return AdventureMissionApi(dio, serializers);
  }

  /// Get AlbumsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AlbumsApi getAlbumsApi() {
    return AlbumsApi(dio, serializers);
  }

  /// Get AuthApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthApi getAuthApi() {
    return AuthApi(dio, serializers);
  }

  /// Get CafeApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CafeApi getCafeApi() {
    return CafeApi(dio, serializers);
  }

  /// Get CandidatesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CandidatesApi getCandidatesApi() {
    return CandidatesApi(dio, serializers);
  }

  /// Get CarBlockingApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CarBlockingApi getCarBlockingApi() {
    return CarBlockingApi(dio, serializers);
  }

  /// Get CarsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CarsApi getCarsApi() {
    return CarsApi(dio, serializers);
  }

  /// Get CouncilApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CouncilApi getCouncilApi() {
    return CouncilApi(dio, serializers);
  }

  /// Get DefaultApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DefaultApi getDefaultApi() {
    return DefaultApi(dio, serializers);
  }

  /// Get DocumentApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DocumentApi getDocumentApi() {
    return DocumentApi(dio, serializers);
  }

  /// Get ElectionsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ElectionsApi getElectionsApi() {
    return ElectionsApi(dio, serializers);
  }

  /// Get EventSignupApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EventSignupApi getEventSignupApi() {
    return EventSignupApi(dio, serializers);
  }

  /// Get EventsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EventsApi getEventsApi() {
    return EventsApi(dio, serializers);
  }

  /// Get GroupsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GroupsApi getGroupsApi() {
    return GroupsApi(dio, serializers);
  }

  /// Get ImgApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ImgApi getImgApi() {
    return ImgApi(dio, serializers);
  }

  /// Get NewsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  NewsApi getNewsApi() {
    return NewsApi(dio, serializers);
  }

  /// Get NollningApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  NollningApi getNollningApi() {
    return NollningApi(dio, serializers);
  }

  /// Get PermissionsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PermissionsApi getPermissionsApi() {
    return PermissionsApi(dio, serializers);
  }

  /// Get PostsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PostsApi getPostsApi() {
    return PostsApi(dio, serializers);
  }

  /// Get SongsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SongsApi getSongsApi() {
    return SongsApi(dio, serializers);
  }

  /// Get SongsCategoryApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SongsCategoryApi getSongsCategoryApi() {
    return SongsCategoryApi(dio, serializers);
  }

  /// Get TagsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TagsApi getTagsApi() {
    return TagsApi(dio, serializers);
  }

  /// Get UserDoorAccessApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserDoorAccessApi getUserDoorAccessApi() {
    return UserDoorAccessApi(dio, serializers);
  }

  /// Get UsersApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UsersApi getUsersApi() {
    return UsersApi(dio, serializers);
  }
}
