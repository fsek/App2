import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:fsek_mobile/util/app_exception.dart';
import 'package:fsek_mobile/util/errors/http_error_messages.dart';
import 'dart:convert';

import '../environments/environment.dart';

class AbstractService {
  static const String API_URL = Environment.API_URL;
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
  };

  static Future<Map> get(String endpoint) async {
    var responseJson;

    try { 
      var response = await http.get(
        API_URL + endpoint,
        headers: headers,
      );
      responseJson = _returnResponse(response);
      updateHeaders(response);
    } on SocketException {
      // Probably no internet on device
      throw FetchDataException(HttpErrorMessage.Message[399]);
    }
    return responseJson;
  }

  static Future<Map> post(String endpoint,
      {String body = "",
      Map<String, dynamic> mapBody}) async {
    var responseJson;

    try {
      var response = await http.post(API_URL + endpoint,
        headers: headers,
        body: body == "" ? jsonEncode(mapBody) : jsonEncode(body));
      responseJson = _returnResponse(response);
      updateHeaders(response);
    } on SocketException {
      // Probably no internet on device
      throw FetchDataException(HttpErrorMessage.Message[399]);
    }
    return responseJson;
  }

  static Map _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        return responseJson;
      case 400:
        print(response.body.toString());
        throw BadRequestException(HttpErrorMessage.Message[399]);
      case 401:
      case 403:
        print(response.body.toString());
        throw UnauthorisedException(HttpErrorMessage.Message[401]);
      case 503:
        print(response.body.toString());
        throw ServiceUnavailableException(HttpErrorMessage.Message[503]);
      case 500:
      default:
        throw FetchDataException(
            '${HttpErrorMessage.Message[499]} Statuscode: ${response.statusCode}');
    }
  }

  static updateHeaders(http.Response response) {
    if(response.headers["access-token"].isNotEmpty)
      headers["access-token"] = response.headers["access-token"];
    if(response.headers["expiry"].isNotEmpty)
      headers["expiry"] = response.headers["expiry"];
  }

  static setToken(String accessToken) {
    headers["access-token"] = accessToken;
  }
}
