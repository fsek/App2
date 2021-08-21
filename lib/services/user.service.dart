import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fsek_mobile/environments/environment.dart';
import 'package:fsek_mobile/models/devise_token.dart';
import 'package:fsek_mobile/models/user/user.dart';
import 'package:fsek_mobile/util/app_exception.dart';
import 'package:fsek_mobile/util/storage_wrapper.dart';

import 'abstract.service.dart';

class UserService extends AbstractService {
  UserService({required this.storage});
  final TokenStorageWrapper storage;
  
  static User? _user; //put in authbloc
  /*
   * HTTP Requests
   */
  Future<DeviseToken> sendLogin({required String email, required String pass}) async {
    try {
      var response = await http.post(
        Uri.parse(Environment.API_URL + "/api/auth/sign_in"),
        headers: AbstractService.headers,
        body: jsonEncode({"email": email, "password": pass}));

      var json = jsonDecode(response.body);
      if(json["data"] != null) {
        setCurrentUser(User.fromJson(json["data"]));
        return DeviseToken.getFromHeaders(response.headers);
      }
      else {
        return DeviseToken(error: json["errors"][0]);
      }
    } on UnauthorisedException catch(e) {
      return DeviseToken(error: e.toString());
    }
  }

  Future<void> signOut() async {
    AbstractService.delete("/auth/sign_out");
    clearToken();
  }

  Future<DeviseToken> validateToken() async {
    try {
      AbstractService.mapAuthHeaders();

      var response = await http.get(
        Uri.parse(Environment.API_URL + "/api/auth/validate_token"),
        headers: AbstractService.headers);

      var json = jsonDecode(response.body);
      if(json["data"] != null) {
        setCurrentUser(User.fromJson(json["data"]));
        return DeviseToken.getFromHeaders(response.headers);
      }
      else {
        return DeviseToken(error: json["errors"][0]);
      }
    } on UnauthorisedException catch(e) {
      return DeviseToken(error: e.toString());
    }
  }

  Future<bool> resetPasswordRequest(String email) async {
    await AbstractService.post("/account/resetpassword", body: email);
    return true;
  }

  static Future<String> getApiVersion() async {
    Map json = await AbstractService.get("/account/apiversion");
    return json["result"];
  }

  Future<User> getUser() async {
    if(_user == null) {
      String? json = await storage.read('user-data');
      if(json != null)
        return User.fromJson(jsonDecode(json));
      else 
        return User(); 
    }
    return _user!;
  }

  Future<Map> updateUser(User updatedUser) async {
    var response = await AbstractService.put("/users/" +updatedUser.id!.toString(),
    mapBody: updatedUser.toJson()); 
    setCurrentUser(updatedUser);
    return response;
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
      if(token.accessToken == null) {
        return false;
      }
      else {
        AbstractService.token = token;
        return true;
      }
    }
    return false;
  }

  Future<bool> isValid() async {
    if(AbstractService.token == null)
      return false;
      
    DateTime? value = AbstractService.token!.expires;
    if (value != null && value.compareTo(DateTime.now().toUtc()) > 0)
      return true;
    return false;
  }
}
