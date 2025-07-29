// import 'dart:async';
// import 'dart:io';

// import 'package:fsek_mobile/models/devise_token.dart';
// import 'package:http/http.dart' as http;
// import 'package:fsek_mobile/environments/environment.dart';
// import 'package:fsek_mobile/util/app_exception.dart';
// import 'package:fsek_mobile/util/errors/http_error_messages.dart';
// import 'dart:convert';

// class NewAbstractService {
//   static DeviseToken? token;
//   // ignore: non_constant_identifier_names
//   static String API_URL = "${Environment.API_URL}";
//   static Map<String, String> headers = {
//     'Content-Type': 'application/json; charset=UTF-8',
//     'Accept': 'application/json',
//   };
//   static void updateApiUrl(bool swedish) {
//     if (swedish) {
//       API_URL = "${Environment.API_URL}";
//     } else {
//       API_URL = "${Environment.API_URL}";
//     }
//   }

//   static Future<Map> get(String endpoint) async {
//     var responseJson;
//     mapAuthHeaders();

//     try {
//       var response = await http.get(
//         Uri.parse(API_URL + endpoint),
//         headers: headers,
//       );
//       responseJson = _returnResponse(response);
//       updateToken(response.headers);
//     } on SocketException {
//       // Probably no internet on device
//       throw FetchDataException(HttpErrorMessage.Message[399]);
//     }
//     return responseJson;
//   }

//   static Future<Map> post(String endpoint,
//       {String body = "", Map<String, dynamic>? mapBody}) async {
//     var responseJson;
//     mapAuthHeaders();

//     try {
//       var response = await http.post(Uri.parse(API_URL + endpoint),
//           headers: headers,
//           body: body == "" ? jsonEncode(mapBody) : jsonEncode(body));
//       responseJson = _returnResponse(response);
//       updateToken(response.headers);
//     } on SocketException {
//       // Probably no internet on device
//       throw FetchDataException(HttpErrorMessage.Message[399]);
//     }
//     return responseJson;
//   }

//   static Future<Map> put(String endpoint,
//       {String body = "", Map<String, dynamic>? mapBody}) async {
//     var responseJson;
//     mapAuthHeaders();
//     try {
//       var response = await http.put(Uri.parse(API_URL + endpoint),
//           headers: headers,
//           body: body == "" ? jsonEncode(mapBody) : jsonEncode(body));
//       responseJson = _returnResponse(response);
//       updateToken(response.headers);
//     } on SocketException {
//       // Probably no internet on device
//       throw FetchDataException(HttpErrorMessage.Message[399]);
//     }
//     return responseJson;
//   }

//   static Future<Map> patch(String endpoint,
//       {String body = "", Map<String, dynamic>? mapBody}) async {
//     var responseJson;
//     mapAuthHeaders();
//     try {
//       var response = await http.patch(Uri.parse(API_URL + endpoint),
//           headers: headers,
//           body: body == "" ? jsonEncode(mapBody) : jsonEncode(body));
//       responseJson = _returnResponse(response);
//       updateToken(response.headers);
//     } on SocketException {
//       // Probably no internet on device
//       throw FetchDataException(HttpErrorMessage.Message[399]);
//     }
//     return responseJson;
//   }

//   static Future<Map> delete(String endpoint,
//       {String body = "", Map<String, dynamic>? mapBody}) async {
//     var responseJson;
//     mapAuthHeaders();

//     try {
//       var response = await http.delete(Uri.parse(API_URL + endpoint),
//           headers: headers,
//           body: body == "" ? jsonEncode(mapBody) : jsonEncode(body));
//       responseJson = _returnResponse(response);
//       updateToken(response.headers);
//     } on SocketException {
//       // Probably no internet on device
//       throw FetchDataException(HttpErrorMessage.Message[399]);
//     }
//     return responseJson;
//   }

//   static Map _returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = json.decode(response.body.toString());
//         // print(responseJson);
//         return responseJson;
//       case 400:
//         throw BadRequestException(HttpErrorMessage.Message[399]);
//       case 401:
//       case 403:
//         throw UnauthorisedException(HttpErrorMessage.Message[401]);
//       case 503:
//         throw ServiceUnavailableException(HttpErrorMessage.Message[503]);
//       case 500:
//       default:
//         throw FetchDataException(
//             '${HttpErrorMessage.Message[499]} Statuscode: ${response.statusCode}');
//     }
//   }

//   static void mapAuthHeaders() {
//     if (token == null) return;
//     headers["access-token"] = token!.accessToken ?? "";
//     headers["uid"] = token!.uid ?? "";
//     headers["client"] = token!.client ?? "";
//     if (token!.expires != null)
//       headers["expires"] =
//           (token!.expires!.millisecondsSinceEpoch * 1000).toString();
//   }

//   static void updateToken(Map<String, String> headers) {
//     if (headers['access-token']?.isNotEmpty ?? false) {
//       DeviseToken token = DeviseToken.getFromHeaders(headers);
//       AbstractService.token = token;
//     }
//   }
// }
