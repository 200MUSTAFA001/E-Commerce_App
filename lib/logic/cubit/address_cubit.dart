import 'package:dartx/dartx.dart';
import 'package:e_commerce_app/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'address_state.dart';

class AddressCubit extends HydratedCubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  void addAddress(AddressModel address) {
    final currentState = state;
    try {
      if (currentState is AddressEmpty) {
        final newAddress = address.copyWith(addressID: 1, defaultAddress: true);
        emit(AddressLoaded(
            addressesList: [newAddress],
            addressID: 1,
            defaultAddress: newAddress));
      } else if (currentState is AddressLoaded) {
        final newID = currentState.addressID + 1;
        final addressesList =
            List<AddressModel>.from(currentState.addressesList);
        if (address.defaultAddress == true) {
          for (var address in addressesList) {
            address.defaultAddress = false;
          }
          final savedAddress =
              address.copyWith(addressID: newID, defaultAddress: true);
          addressesList.add(savedAddress);
          emit(AddressLoaded(
            addressesList: addressesList,
            addressID: newID,
            defaultAddress: savedAddress,
          ));
        } else {
          final savedAddress = address.copyWith(addressID: newID);
          addressesList.add(savedAddress);
          final defaultAddress = addressesList
              .firstOrNullWhere((address) => address.defaultAddress == true);
          emit(AddressLoaded(
            addressesList: addressesList,
            addressID: newID,
            defaultAddress: defaultAddress,
          ));
        }
      }
    } catch (e) {
      emit(AddressError());
    }
  } // DONE

  void removeAddress(int addressID) {
    final currentState = state;

    if (currentState is AddressLoaded) {
      final addressesList = List<AddressModel>.from(currentState.addressesList);

      final address = addressesList.firstWhere((a) => a.addressID == addressID);

      addressesList.removeWhere((address) => address.addressID == addressID);

      if (address.defaultAddress == true) {
        emit(AddressLoaded(
          addressesList: addressesList,
          addressID: currentState.addressID,
          defaultAddress: null,
        ));
      } else if (address.defaultAddress == false) {
        emit(AddressLoaded(
          addressesList: addressesList,
          addressID: currentState.addressID,
          defaultAddress: currentState.defaultAddress,
        ));
      }
    }
  } // DONE

  void editAddress(int addressID, AddressModel modifiedAddress) {
    final currentState = state;

    if (currentState is AddressLoaded) {
      final addressesList = List<AddressModel>.from(currentState.addressesList);

      // for removing
      addressesList.removeWhere((address) => address.addressID == addressID);

      // for adding new modified address
      if (modifiedAddress.defaultAddress == true) {
        for (var address in addressesList) {
          address.defaultAddress = false;
        }
        final savedAddress = modifiedAddress;
        addressesList.add(savedAddress);
        emit(AddressLoaded(
          addressesList: addressesList,
          addressID: modifiedAddress.addressID!,
          defaultAddress: savedAddress,
        ));
      } else {
        final savedAddress = modifiedAddress;
        addressesList.add(savedAddress);
        final defaultAddress = addressesList
            .firstOrNullWhere((address) => address.defaultAddress == true);
        emit(AddressLoaded(
          addressesList: addressesList,
          addressID: modifiedAddress.addressID!,
          defaultAddress: defaultAddress,
        ));
      }
    }
  } // DONE

  void changeAddressID(int addressID, AddressModel modifiedAddress) {
    final currentState = state;
    if (currentState is AddressLoaded) {
      final addressesList = List<AddressModel>.from(currentState.addressesList);
      final newID = currentState.addressID + 1;

      final defaultAddress = addressesList
          .firstOrNullWhere((address) => address.defaultAddress == true);

      //
      if (defaultAddress != null) {
        final defaultAddressUpdated =
            defaultAddress.copyWith(defaultAddress: false, addressID: newID);

        final modifiedAddressUpdated = modifiedAddress.copyWith(
            addressID: addressID, defaultAddress: true);

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
            addressesList: addressesList,
            addressID: addressID,
            defaultAddress: modifiedAddressUpdated));
      } else {
        addressesList.removeWhere((address) {
          final tempBool = modifiedAddress.addressID! == address.addressID! &&
              modifiedAddress.pinCode == address.pinCode;

          return tempBool;
        });
        final modifiedAddressUpdated = modifiedAddress.copyWith(
            addressID: addressID, defaultAddress: true);
        addressesList.add(modifiedAddressUpdated);
        emit(AddressLoaded(
          addressesList: addressesList,
          addressID: newID,
          defaultAddress: modifiedAddressUpdated,
        ));
      }
      //
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
      final jsonList = json["addressesList"] as List;
      final addressesList =
          jsonList.map((address) => AddressModel.fromJson(address)).toList();
      final addressID = json["addressID"] as int? ?? 0;
      final jsonDefaultAddress = json["defaultAddress"];
      final defaultAddress = jsonDefaultAddress != null
          ? AddressModel.fromJson(jsonDefaultAddress)
          : null;
      if (addressesList.isEmpty) {
        return AddressEmpty();
      } else {
        return AddressLoaded(
          addressesList: addressesList,
          addressID: addressID,
          defaultAddress: defaultAddress,
        );
      }
    } catch (e) {
      return AddressError();
    }
  }

  @override
  Map<String, dynamic>? toJson(AddressState state) {
    if (state is AddressLoaded) {
      final storedList = state.addressesList;
      final addressID = state.addressID;
      final defaultAddress = state.defaultAddress;

      return {
        "addressesList": storedList.map((address) => address.toJson()).toList(),
        "addressID": addressID,
        "defaultAddress": defaultAddress?.toJson(),
      };
    }
    return null;
  }
}
