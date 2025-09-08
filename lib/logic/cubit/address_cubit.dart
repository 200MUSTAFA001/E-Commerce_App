import 'dart:developer';

import 'package:e_commerce_app/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'address_state.dart';

class AddressCubit extends HydratedCubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  void addAddress(AddressModel address) {
    final currentState = state;
    try {
      if (currentState is AddressLoaded) {
        //
        final newID = currentState.addressID + 1;
        //
        final addressesList =
            List<AddressModel>.from(currentState.userAddressesList);

        if (address.defaultAddress == true) {
          for (var address in addressesList) {
            address.defaultAddress = false;
          }
          final savedAddress =
              address.copyWith(addressID: newID, defaultAddress: true);
          addressesList.add(savedAddress);
        } else {
          final savedAddress = address.copyWith(addressID: newID);
          addressesList.add(savedAddress);
        }
        log("${addressesList.map((v) => v.addressID).toList()}");
        final defaultAddress = addressesList
            .firstWhere((address) => address.defaultAddress == true);
        emit(AddressLoaded(
            userAddressesList: addressesList,
            addressID: newID,
            defaultAddress: defaultAddress));
      } else {
        emit(AddressLoaded(userAddressesList: [
          address.copyWith(addressID: 1, defaultAddress: true)
        ], addressID: 1, defaultAddress: address));
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

      final address = addressesList.firstWhere((a) => a.addressID == addressID);

      //
      final defaultAddress =
          addressesList.firstWhere((address) => address.defaultAddress == true);

      if (address.defaultAddress == false) {
        addressesList.removeWhere((address) => address.addressID == addressID);

        if (addressesList.isEmpty) {
          emit(AddressEmpty());
        } else {
          emit(AddressLoaded(
              userAddressesList: addressesList,
              addressID: currentState.addressID,
              defaultAddress: defaultAddress));
        }
      } else {
        // Todo : if the address is a default address removing logic
      }
    }
  }

  void editAddress(int addressID, AddressModel modifiedAddress) {
    final currentState = state;

    if (currentState is AddressLoaded) {
      final addressesList =
          List<AddressModel>.from(currentState.userAddressesList);

      // for removing
      addressesList.removeWhere((address) => address.addressID == addressID);

      // for adding new modified address
      if (modifiedAddress.defaultAddress == true) {
        for (var address in addressesList) {
          address.defaultAddress = false;
        }
        final savedAddress = modifiedAddress;
        addressesList.add(savedAddress);
      } else {
        final savedAddress = modifiedAddress;
        addressesList.add(savedAddress);
      }
      final defaultAddress =
          addressesList.firstWhere((address) => address.defaultAddress == true);
      //
      emit(AddressLoaded(
        userAddressesList: addressesList,
        addressID: modifiedAddress.addressID!,
        defaultAddress: defaultAddress,
      ));
      //
    }
  }

  void changeAddressID(int addressID, AddressModel modifiedAddress) {
    final currentState = state;
    if (currentState is AddressLoaded) {
      final addressesList =
          List<AddressModel>.from(currentState.userAddressesList);
      final newID = currentState.addressID + 1;

      final defaultAddress =
          addressesList.firstWhere((address) => address.defaultAddress == true);

      final defaultAddressUpdated =
          defaultAddress.copyWith(defaultAddress: false, addressID: newID);

      final modifiedAddressUpdated =
          modifiedAddress.copyWith(addressID: addressID, defaultAddress: true);

      addressesList.removeWhere((address) {
        final tempBool = defaultAddress.addressID! == address.addressID! &&
            defaultAddress.pinCode == address.pinCode;

        return tempBool;
      });
      addressesList.removeWhere((address) {
        final tempBool = modifiedAddress.addressID! == address.addressID! &&
            modifiedAddress.pinCode == address.pinCode;

        return tempBool;
      });

      addressesList.add(defaultAddressUpdated);
      addressesList.add(modifiedAddressUpdated);

      emit(AddressLoaded(
          userAddressesList: addressesList,
          addressID: newID,
          defaultAddress: modifiedAddressUpdated));
    } else {
      emit(AddressEmpty());
    }
  }

  bool isAddressListNotEmpty() {
    if (state is AddressLoaded) {
      return true;
    } else {
      return false;
    }
  }

  @override
  AddressState? fromJson(Map<String, dynamic> json) {
    try {
      final jsonAddressesList = json["addressesList"] as List;
      final userAddressesList = jsonAddressesList
          .map((address) => AddressModel.fromJson(address))
          .toList();
      final defaultAddress = userAddressesList
          .firstWhere((address) => address.defaultAddress == true);

      if (userAddressesList.isEmpty) return AddressEmpty();

      return AddressLoaded(
        userAddressesList: userAddressesList,
        addressID: json["addressID"] as int? ?? 0,
        defaultAddress: defaultAddress,
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
