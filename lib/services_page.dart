import 'dart:convert';
import 'package:http/http.dart' as http;

class ExchangeRateService {
  final String apiKey = '4700efd6a373700f8789ecd6';
  final String baseUrl = 'https://v6.exchangerate-api.com/v6';

  Future<Map<String, dynamic>> getExchangeRates(String baseCurrency) async {
    final url = '$baseUrl/$apiKey/latest/$baseCurrency';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }
}