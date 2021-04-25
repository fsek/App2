import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fsek_mobile/models/api_login_result.dart';
import 'package:fsek_mobile/models/mobileAPIToken.dart';
import 'package:fsek_mobile/models/user/user.dart';
import 'package:fsek_mobile/util/app_exception.dart';
import 'package:fsek_mobile/util/storage_wrapper.dart';

import 'abstract.service.dart';

class UserService extends AbstractService {
  UserService({@required this.storage}) : assert(storage != null);
  final TokenStorageWrapper storage;
  
  static User user; //put in authbloc
  /*
   * HTTP Requests
   */
  Future<dynamic> sendLogin({String email, String pass}) async {
    Map json = await AbstractService.get("/account/login",
      authHeader: 'Basic ' + base64.encode(utf8.encode(email.trim() + ":" + pass)));

    if (confirmLogin(json)) {
      return MobileAPIToken.fromJson(json['token']);
    } else {
      return APILoginResult.values[json['result']];
    }
  }

  Future<User> getUserRequest() async {
    Map json = await AbstractService.get("/account/user");
    return User.fromJson(json);
  }

  Future<MobileAPIToken> refreshTokenRequest(String refreshToken) async {
    try {
      Map json = await AbstractService.get("/account/refreshaccess", authHeader: 'Bearer ' + refreshToken);
      return MobileAPIToken.fromJson(json);
    } catch (ex) {
      rethrow;
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

  static bool confirmLogin(Map<dynamic, dynamic> json) {
    switch (APILoginResult.values[json['result']]) {
      case APILoginResult.Success:
        return true;
      default:
        print(APILoginResult.values[json['result']].toString());
        return false;
    }
  }

  //Token Functions
  void storeToken(MobileAPIToken token) {
    storage.write(key: "access_token", value: token.accessToken);
    storage.write(key: "refresh_token", value: token.refreshToken);
    storage.write(key: "expires", value: token.expires.toUtc().toString());
    AbstractService.token = token.accessToken;
  }

  Future<MobileAPIToken> refreshToken() async {
    var refreshToken = await storage.read(key: "refresh_token");
    if (refreshToken == null) return new MobileAPIToken();

    MobileAPIToken token = await refreshTokenRequest(refreshToken);
    if(token.accessToken == null || token.accessToken == "") {
      throw UnauthorisedException("Could not refresh token");
    }
    else {
      token.refreshToken = refreshToken;
      storeToken(token);
      return token;
    }
  }

  void clearToken() {
    storage.delete(key: "access_token");
    storage.delete(key: "refresh_token");
    storage.delete(key: "expires");
    AbstractService.token = null;
  }

  // These two functions are seperated so we can see if a token
  // has expired or just dosent exist
  Future<bool> isAuthenticated() async {
    var value = await storage.read(key: 'access_token');
    if (value != null) {
      AbstractService.token = value;
      return true;
    }
    return false;
  }

  Future<bool> isValid() async {
    var value = await storage.read(key: 'expires');
    if (value != null &&
        DateTime.parse(value).compareTo(DateTime.now().toUtc()) > 0)
      return true;
    return false;
  }
}
