import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/result.dart';

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = "https://pixabay.com/api/";
  static const apiKey = "36248505-691a3381d94fad8b197cd0d86";

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client.get(Uri.parse(
          "$baseUrl?key=$apiKey&q=$query&image_type=photo&pretty=true"));

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return Result.success(jsonResponse['hits']);
    } catch (e) {
      return const Result.error("네트워크 에러");
    }
  }
}
