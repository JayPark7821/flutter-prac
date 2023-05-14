import 'package:http/http.dart' as http;

class StockApi {
  static const baseUrl = "https://alphavantage.co/";
  static const apiKey = "F2W8LP7ZDI1C1L32";
  final http.Client _client;

  StockApi({http.Client? client}) : _client = client ?? http.Client();

  Future<http.Response> getListings({String apiKey = apiKey}) async {
    return await _client.get(
      Uri.parse("${baseUrl}query?function=LISTING_STATUS&apikey=$apiKey"),
    );
  }
}
