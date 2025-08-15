import 'dart:async';
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:fsek_mobile/environments/environment.dart';
import 'package:fsek_mobile/models/devise_token.dart';
import 'package:fsek_mobile/models/user/user.dart';
import 'package:fsek_mobile/util/app_exception.dart';
import 'package:fsek_mobile/util/storage_wrapper.dart';
import 'api.service.dart';

import 'abstract.service.dart';

class UserService extends AbstractService {
  UserService({required this.storage});
  final TokenStorageWrapper storage;

  static User? _user; //put in authbloc
  /*
   * HTTP Requests
   */
  Future<DeviseToken> sendLogin(
      {required String username, required String pass}) async {
    try {
      final response = await ApiService.apiClient
          .getAuthApi()
          .authAuthCookieLogin(
              username: username, password: pass, grantType: "password");

      final token = response.data?.accessToken;

      if (token != null) {
        storage.write(key: "access_token", value: token);

        ApiService.apiClient.setOAuthToken('OAuth2PasswordBearer', token);
      }

      return DeviseToken(accessToken: token);
    } on UnauthorisedException catch (e) {
      return DeviseToken(error: e.toString());
    }
  }

  Future<void> signOut() async {
    await ApiService.apiClient.getAuthApi().authAuthCookieLogout();
  }

  Future<DeviseToken> validateToken() async {
    try {
      final token = await storage.read('access_token');

      if (token == null) {
        return DeviseToken(error: 'No token found in storage');
      }

      final response = await ApiService.apiClient.getAuthApi().authVerifyVerify(
          bodyAuthVerifyVerify: BodyAuthVerifyVerify((b) => b..token = token));

      return DeviseToken(accessToken: token);
    } on UnauthorisedException catch (e) {
      return DeviseToken(error: e.toString());
    } catch (e) {
      return DeviseToken(error: 'Unexpected error: $e');
    }
  }

  Future<bool> resetPasswordRequest(String email) async {
    try {
      await ApiService.apiClient.getAuthApi().authResetForgotPassword(
          bodyAuthResetForgotPassword:
              BodyAuthResetForgotPassword((b) => b..email = email));
    } catch (e) {
      throw AppException('Failed to send password reset request: $e');
    }

    return true;
  }

  Future<User> getUser() async {
    if (_user == null) {
      String? json = await storage.read('user-data');
      if (json != null)
        return User.fromJson(jsonDecode(json));
      else
        return User();
    }
    return _user!;
  }

  void syncUser() async {
    //Force a sync of the user object check getUser for why
    _user = null;
    await getUser();
  }

/*   Future<Map> updateUser(User updatedUser) async {
    try {
      var response = await ApiService.apiClient
          .getUsersApi()
          .usersUpdateSelf(userUpdate: updatedUser.toJson());
      setCurrentUser(updatedUser);
      return response;
    } catch (error) {
      throw error;
    }
  } */

  //Token Functions
  void storeToken(DeviseToken token) {
    DeviseToken.storeToken(storage, token);
    AbstractService.token = token;
  }

  void clearToken() {
    DeviseToken.clearToken(storage);
    AbstractService.token = DeviseToken();
    AbstractService.mapAuthHeaders();
  }

  void setCurrentUser(User user) {
    _user = user;
    storage.write(key: "user-data", value: jsonEncode(user.toJson()));
  }

  // These two functions are seperated so we can see if a token
  // has expired or just dosent exist
  Future<bool> isAuthenticated() async {
    var value = AbstractService.token;
    if (value == null) {
      DeviseToken token = await DeviseToken.getFromStorage(storage);
      if (token.accessToken == null) {
        return false;
      } else {
        AbstractService.token = token;
        return true;
      }
    }
    return false;
  }

  Future<bool> isValid() async {
    if (AbstractService.token == null) return false;

    DateTime? value = AbstractService.token!.expires;
    if (value != null && value.compareTo(DateTime.now().toUtc()) > 0)
      return true;
    return false;
  }
}
