import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:fsek_mobile/models/devise_token.dart';
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
    try {
      Map json = await AbstractService.post("/auth/sign_in", mapBody: {"email": email, "password": pass});
      if(json["data"] != null)
        //user = User.fromJson(json["data"]);
        return DeviseToken(accessToken: AbstractService.headers["access-token"], expires: timeConvert(AbstractService.headers["expiry"]));
      else
        return DeviseToken(error: json["errors"][0]);
    } on UnauthorisedException catch(e) {
      return DeviseToken(error: e.toString());
    }
  }

  Future<User> getUserRequest() async {
    Map json = await AbstractService.get("/account/user");
    return User.fromJson(json);
  }

  Future<bool> resetPasswordRequest(String email) async {
    await AbstractService.post("/account/resetpassword", body: email);
    return true;
  }

  static Future<String> getApiVersion() async {
    Map json = await AbstractService.get("/account/apiversion");
    return json["result"];
  }

  //Token Functions
  void storeToken(DeviseToken token) {
    storage.write(key: "access-token", value: token.accessToken);
    storage.write(key: "expires", value: token.expires.toString());
  }

  void clearToken() {
    storage.delete(key: "access-token");
    storage.delete(key: "expires");
    AbstractService.headers["Authorization"] = "";
  }

  // These two functions are seperated so we can see if a token
  // has expired or just dosent exist
  Future<bool> isAuthenticated() async {
    var value = await storage.read(key: 'access-token');
    if (value != null) {
      AbstractService.headers["Authorization"] = "Bearer " + value;
      return true;
    }
    return false;
  }

  Future<bool> isValid() async {
    var value = await storage.read(key: 'expires');
    if (value != null &&
        timeConvert(value).compareTo(DateTime.now().toUtc()) > 0)
      return true;
    return false;
  }

  DateTime timeConvert(String rubytimestring) {
    int rubytime = int.parse(rubytimestring);
    return DateTime.fromMillisecondsSinceEpoch(rubytime*1000);
  }
}
