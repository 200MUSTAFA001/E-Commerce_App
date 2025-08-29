import 'package:api_app/data/models/address_result_model.dart';
import 'package:api_app/data/repository/address_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'address_service_state.dart';

class AddressServiceCubit extends Cubit<AddressServiceState> {
  AddressServiceCubit(this.addressRepo) : super(AddressServiceInitial());

  final AddressRepo addressRepo;

  Future<void> getSearchedAddressesList(String addressName) async {
    final addressesList = await addressRepo.getAddressByName(addressName);
    emit(AddressServiceLoaded(addressesList: addressesList));
  }
}
