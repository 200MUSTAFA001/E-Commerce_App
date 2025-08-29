import 'dart:convert';

import 'package:api_app/data/models/address_result_model.dart';
import 'package:api_app/data/services/address_service.dart';

class AddressRepo {
  AddressRepo(this.addressService);

  final AddressService addressService;

  Future<List<AddressResultModel>> getAddressByName(String addressName) async {
    final serviceResponse = await addressService.getAddress(addressName);
    final jsonString = json.encode(serviceResponse);
    final result = addressResultModelFromJson(jsonString);

    return result;
  }
}
