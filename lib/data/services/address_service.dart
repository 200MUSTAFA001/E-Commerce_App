import 'package:dio/dio.dart';

import '../../api_key.dart';

class AddressService {
  Future<dynamic> getAddress(String addressName) async {
    final dio = Dio();
    const baseUrl = "https://api.locationiq.com/v1";
    final url = "$baseUrl/autocomplete?key=$apiKey&q=$addressName";
    final response = await dio.get(url);

    return response.data;
  }
}
