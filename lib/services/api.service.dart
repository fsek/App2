import 'package:api_client/api_client.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:fsek_mobile/util/secure_cookie_storage.dart';

class ApiService {
  static final CookieJar cookieJar = PersistCookieJar(
      ignoreExpires: true, storage: SecureStorageCookieStorage());
  static final CookieManager cookieManager = CookieManager(cookieJar);
  static final ApiClient apiClient = ApiClient(interceptors: [cookieManager]);
}
