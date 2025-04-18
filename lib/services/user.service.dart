import 'dart:async';
import 'dart:convert';
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
      // var response = await http.post(
      //     Uri.parse(Environment.API_URL + "/api/auth/sign_in"),
      //     headers: AbstractService.headers,
      //     body: jsonEncode({"email": email, "password": pass}));

      final response = await ApiService.apiClient.getAuthApi().authAuthJwtLogin(username: username, password: pass, grantType: "password");

      final token = response.data?.accessToken;


      if(token != null){
        storage.write(key: "access_token", value: token);
      }

      ApiService.apiClient.setBearerAuth('Authorization', token!);

      ApiService.apiClient.setOAuthToken('OAuth2', token);



      return DeviseToken(accessToken: token);

      // var json = jsonDecode(response.body);
      // if (json["data"] != null) {
      //   setCurrentUser(User.fromJson(json["data"]));
      //   return DeviseToken.getFromHeaders(response.headers);
      // } else {
      //   var err = json["errors"] ?? json["error"];
      //   String? msg;

      //   if (err != null) {
      //     msg = err[0];
      //   }
      //   return DeviseToken(error: msg);
      // }
    } on UnauthorisedException catch (e) {
      return DeviseToken(error: e.toString());
    }
  }

  Future<void> signOut() async {
    await ApiService.apiClient.getAuthApi().authAuthJwtLogout();
    // AbstractService.delete("/auth/sign_out");
    // clearToken();
  }

  Future<DeviseToken> validateToken() async {
    try {
      // AbstractService.mapAuthHeaders();

      // var response = await http.get(
      //     Uri.parse(Environment.API_URL + "/api/auth/validate_token"),
      //     headers: AbstractService.headers);

      // var json = jsonDecode(response.body);
      // if (json["data"] != null) {
      //   setCurrentUser(User.fromJson(json["data"]));
      //   return DeviseToken.getFromHeaders(response.headers);
      

      final token = await storage.read('accessToken');

      if (token == null) {
      return DeviseToken(error: 'No token found in storage');
      }

      final response = await ApiService.apiClient.getAuthApi().authVerifyVerify(bodyAuthVerifyVerify: BodyAuthVerifyVerify((b) => b..token = token));

      return DeviseToken(accessToken: token);

      }
      on UnauthorisedException catch (e) {
       return DeviseToken(error: e.toString());
      }
      catch (e) {
        return DeviseToken(error: 'Unexpected error: $e');
      }
  }

  Future<bool> resetPasswordRequest(String email) async {
    dynamic ret = await http.post(
        Uri.parse(
          Environment.API_URL + "/api/auth/password",
        ),
        body: '{"email": "' + email + '", "redirect_url": "/home"}',
        headers: AbstractService.headers);
    return true;
  }

  static Future<String> getApiVersion() async {
    Map json = await AbstractService.get("/account/apiversion");
    return json["result"];
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

  Future<Map> updateUser(User updatedUser) async {
    try {
      var response = await AbstractService.put(
          "/users/" + updatedUser.id!.toString(),
          mapBody: updatedUser.toJson());
      setCurrentUser(updatedUser);
      return response;
    } catch (error) {
      throw error;
    }
  }

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
