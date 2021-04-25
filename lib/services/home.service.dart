import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fsek_mobile/environments/environment.dart';

import 'package:http/http.dart' as http;
import 'package:fsek_mobile/util/app_exception.dart';
import 'package:fsek_mobile/util/errors/http_error_messages.dart';
import 'abstract.service.dart';

class HomeService extends AbstractService {

  /*
   * HTTP Requests
   */
  /*
  Future<Map<String, List<dynamic>>> getDeviceListRequest() async {
    Map json = await AbstractService.get("/home/noderesources");   
    List<DepartmentData> departments = (json['departments'] as List).map((data) => DepartmentData.fromJson(data)).toList();
    List<Device> devices = (json['devices'] as List).map((data) => Device.fromJson(data)).toList();
    var result = {"devices": devices, "departments": departments};
    return result;
  }
  Future<List<DepartmentData>> getFlatDepartments() async {
    Map json = await AbstractService.get("/settings/departments");
    List<DepartmentData> departments = (json['departments'] as List).map((data) => DepartmentData.fromJson(data)).toList();
    return departments;
  }
  Future<HomeData> getHomeData() async {
    Map json = await AbstractService.get("/home/stats");
    return HomeData.fromJson(json);
  }
  Future<List<MobileWarning>> getMobileWarnings() async {
    Map json = await AbstractService.get("/home/warnings");
    List<MobileWarning> warnings = (json['data'] as List).map((data) => MobileWarning.fromJson(data)).toList();
    return warnings;
  }*/
  
  // Bit of a hack, but ehh
  Future<bool> isGoodApiVersion() async {
    try {
      String url = Environment.API_URL + "/v" + (Environment.API_VERSION+1).toString() + "/account/user";
      var response = await http.get(
        url,
        headers: AbstractService.headers,
      );
      if(response.statusCode == 200 && response.headers["content-type"] == "application/json; charset=utf-8")
        return false;
    } on SocketException {
      throw FetchDataException(HttpErrorMessage.Message[399]);
    } on http.ClientException {
      if(!kIsWeb)
        rethrow;
    }
    return true;
  }
}