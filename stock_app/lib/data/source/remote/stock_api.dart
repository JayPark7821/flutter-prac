import 'package:http/http.dart' as http;

class StockApi {
  static const baseUrl = "https://alphavantage.co/";
  static const apiKey = "F2W8LP7ZDI1C1L32";
  final http.Client client;

  StockApi(this.client);

  Future<http.Response> getListings(String apiKey) async {
    return await client.get(
      Uri.parse("${baseUrl}query?function-LISTING_STATUS&apikey=$apiKey"),
    );
  }
}
