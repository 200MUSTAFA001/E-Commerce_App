import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AddressService {
  Future<dynamic> getAddress(String addressName) async {
    final dio = Dio();
    final apiKey = dotenv.env["API_KEY"];
    const baseUrl = "https://api.locationiq.com/v1";
    final url = "$baseUrl/autocomplete?key=$apiKey&q=$addressName";
    final response = await dio.get(url);

    return response.data;
  }
}
