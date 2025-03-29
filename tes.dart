import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fsek_mobile/api_client/lib/src/api/events_api.dart';
import 'package:fsek_mobile/api_client/lib/src/serializers.dart';
import 'package:fsek_mobile/environments/environment.dart';

void main() async {
  // Create an instance of Dio.
  final dio = Dio(BaseOptions(baseUrl: Environment.LOCAL_API_URL));

  // You also need to provide an instance of Serializers.
  // This will typically be generated along with your API client.
  final serializers =
      standardSerializers; // Replace with your actual serializers instance

  // Create an instance of EventsApi.
  final eventsApi = EventsApi(dio, serializers);

  // Now you can call the method on the instance.
  final response = await eventsApi.eventsGetAllEvents();

  // Use the response.
  print(response.data);
}
