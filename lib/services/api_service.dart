import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/deal_model.dart';

class ApiService {
  final String baseUrl = 'https://api.restful-api.dev/objects';

  Future<List<Deal>> fetchDeals() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((deal) => Deal.fromJson(deal)).toList();
    } else {
      throw Exception('Ürünlerin yüklenmesinde sorun oluştu');
    }
  }
}
