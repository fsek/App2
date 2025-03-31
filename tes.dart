import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/api_client/lib/src/api/events_api.dart';
import 'package:fsek_mobile/api_client/lib/src/serializers.dart';
import 'package:fsek_mobile/environments/environment.dart';

void main() async {
  // Now you can call the method on the instance.
  final response = await ApiClient().getAdsApi().adsGetAllAds();

  // Use the response.
  print(response.data);
}
