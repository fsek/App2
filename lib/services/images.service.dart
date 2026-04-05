import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/environments/environment.dart';
import 'package:http/http.dart' as http;

import 'abstract.service.dart';

class ImagesService extends AbstractService {
  final Map<String, String> _headers = {
    "Authorization": "Bearer ${ApiService.access_token}",
  };

  Future<Uint8List> fetchImageBytes(int id) async {  // Would like to get rid of this too but don't know how to get downloadable bytes then.
    try {
      final url = "${Environment.API_URL}/img/images/$id/original";
      // final url = "https://backend.fsektionen.se/img/images/${id}/original";
      final response = await http.get(Uri.parse(url),
          headers: {"Authorization": "Bearer ${ApiService.access_token}"});

      if (response.statusCode != 200 || response.bodyBytes.isEmpty) {
        throw Exception("Failed to load image: HTTP ${response.statusCode}");
      }

      return response.bodyBytes;
    } catch (e) {
      print("Error fetching image: $e");
      throw Exception("Image fetch failed");
    }
  }

  ImageProvider fetchImage(int id, {bool isThumbnail = false}) {
    final url = getUrl(id, isThumbnail: isThumbnail);
    final provider = NetworkImage(  // Built-in caching
      url,
      headers: _headers,
    );

    print("Fetching id: $id");

    return provider;
  }

  String getUrl(int id, {bool isThumbnail = false}) {
    return "${Environment.API_URL}/img/images/$id/${isThumbnail ? "small" : "original"}";
  }

  Map<String, String>? getHeaders() {
    return _headers;
  }
}
