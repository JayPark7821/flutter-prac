import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/photo.dart';

class PixabayApi {
  static const baseUrl = "https://pixabay.com/api/";
  static const apiKey = "36248505-691a3381d94fad8b197cd0d86";

  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        "$baseUrl?key=$apiKey&q=$query&image_type=photo&pretty=true"));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
