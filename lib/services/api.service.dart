import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:fsek_mobile/util/secure_cookie_storage.dart';
import 'package:fsek_mobile/environments/environment.dart';

class ApiService {
  static final CookieJar cookieJar = PersistCookieJar(
      ignoreExpires: true, storage: SecureStorageCookieStorage());
  static final CookieManager cookieManager = CookieManager(cookieJar);
  static String? _access_token;

  static String? get access_token {
    return _access_token;
  }

  static void set access_token(String? token) {
    if (token != null) {
      apiClient.setOAuthToken('OAuth2PasswordBearer', token);
    }
    _access_token = token;
  }

  // Environment.API_URL

  static final ApiClient apiClient =
      ApiClient(basePathOverride: "https://stage.backend.fsektionen.se", interceptors: [
    cookieManager,
    OAuthInterceptor(),
    InterceptorsWrapper(
      onError: (error, handler) async {
        if ((error.response?.statusCode == 403 ||
                error.response?.statusCode == 401) &&
            !error.requestOptions.path.contains("auth") &&
            error.requestOptions.extra["noretry"] != true) {
          if (await ApiService.isValid()) {
            try {
              var requestOptions = error.requestOptions;
              requestOptions.extra["noretry"] = true;
              var response = await apiClient.dio.fetch(requestOptions);
              handler.resolve(response);
            } on DioException catch (e) {
              print(e);
              handler.reject(e);
            } catch (e) {
              handler.reject(error);
            }
          } else {
            handler.next(error);
          }
        } else {
          handler.next(error);
        }
      },
    )
  ]);
  static Future<bool> isValid() async {
    if (ApiService.access_token == null) {
      try {
        var response =
            await ApiService.apiClient.getAuthApi().authAuthCookieRefresh();
        if (response.data == null || response.data?.accessToken == null) {
          return false;
        }
        ApiService.access_token = response.data!.accessToken;
        return true;
      } catch (e) {
        return false;
      }
    }
    dynamic token;
    try {
      var data = base64.normalize(ApiService.access_token!.split(".")[1]);
      token = json.decode(utf8.decode(base64.decode(data)));
    } catch (e) {}
    DateTime? value = DateTime.fromMillisecondsSinceEpoch(token["exp"] * 1000);
    if (value.compareTo(DateTime.now().toUtc()) > 0)
      return true;
    else {
      try {
        var response =
            await ApiService.apiClient.getAuthApi().authAuthCookieRefresh();
        ApiService.access_token = response.data!.accessToken;
        return true;
      } catch (e) {
        return false;
      }
    }
  }
}
