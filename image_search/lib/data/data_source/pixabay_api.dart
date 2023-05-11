import 'dart:convert';

import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = "https://pixabay.com/api/";
  static const apiKey = "36248505-691a3381d94fad8b197cd0d86";

  Future<Iterable> fetch(String query) async {
    final response = await client.get(Uri.parse(
        "$baseUrl?key=$apiKey&q=$query&image_type=photo&pretty=true"));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    return jsonResponse['hits'];
  }
}
