import 'package:api_app/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'address_state.dart';

class AddressCubit extends HydratedCubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  void addAddress(AddressModel address) {
    //
    final currentState = state;
    //
    try {
      if (currentState is AddressLoaded) {
        //
        final newID = currentState.addressID + 1;
        //
        final addressesList =
            List<AddressModel>.from(currentState.userAddressesList);

        final savedAddress = address.copyWith(addressID: newID);

        addressesList.add(savedAddress);

        emit(AddressLoaded(userAddressesList: addressesList, addressID: newID));
      } else {
        emit(AddressLoaded(
            userAddressesList: [address.copyWith(addressID: 1)], addressID: 1));
      }
    } catch (e) {
      emit(AddressError());
    }
  }

  void removeAddress(int addressID) {
    final currentState = state;

    if (currentState is AddressLoaded) {
      final addressesList =
          List<AddressModel>.from(currentState.userAddressesList);

      addressesList.removeWhere((address) => address.addressID == addressID);

      if (addressesList.isEmpty) {
        emit(AddressEmpty());
      } else {
        emit(AddressLoaded(
            userAddressesList: addressesList,
            addressID: currentState.addressID));
      }
    }
  }

  @override
  AddressState? fromJson(Map<String, dynamic> json) {
    try {
      final jsonAddressesList = json["addressesList"] as List;
      final userAddressesList = jsonAddressesList
          .map((address) => AddressModel.fromJson(address))
          .toList();

      if (userAddressesList.isEmpty) return AddressEmpty();

      return AddressLoaded(
        userAddressesList: userAddressesList,
        addressID: json["addressID"] as int? ?? 0,
      );
    } catch (e) {
      return AddressError();
    }
  }

  @override
  Map<String, dynamic>? toJson(AddressState state) {
    if (state is AddressLoaded) {
      final storedList = state.userAddressesList;
      final addressID = state.addressID;

      return {
        "addressesList": storedList.map((address) => address.toJson()).toList(),
        "addressID": addressID,
      };
    }
    return null;
  }
}
