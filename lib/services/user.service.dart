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
  
  static User? user; //put in authbloc
  /*
   * HTTP Requests
   */
  Future<dynamic> sendLogin({required String email, required String pass}) async {
    try {
      var response = await http.post(
        Uri.parse(Environment.API_URL + "/auth/sign_in"),
        headers: AbstractService.headers,
        body: jsonEncode({"email": email, "password": pass}));
      var json = jsonDecode(response.body);
      if(json["data"] != null) {
        user = User.fromJson(json["data"]);
        return DeviseToken(accessToken: response.headers["access-token"], expires: timeConvert(response.headers["expiry"]));
      }
      else
        return DeviseToken(error: json["errors"][0]);
    } on UnauthorisedException catch(e) {
      return DeviseToken(error: e.toString());
    }
  }

  Future<User> getUserRequest() async {
    Map json = await AbstractService.get("/account/user");
    return User.fromJson(json as Map<String, dynamic>);
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
    var value = await storage.read('access-token');
    if (value != null) {
      AbstractService.headers["Authorization"] = "Bearer " + value;
      return true;
    }
    return false;
  }

  Future<bool> isValid() async {
    var value = await storage.read('expires');
    if (value != null &&
        timeConvert(value).compareTo(DateTime.now().toUtc()) > 0)
      return true;
    return false;
  }

  DateTime timeConvert(String? rubytimestring) {
    if(rubytimestring == null)
      return DateTime.now();

    int? time = int.tryParse(rubytimestring);
    if(time == null)
      return DateTime.now();

    int rubytime = int.parse(rubytimestring);
    return DateTime.fromMillisecondsSinceEpoch(rubytime*1000);
  }
}
