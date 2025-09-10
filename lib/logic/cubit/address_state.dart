part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoaded extends AddressState {
  final List<AddressModel> addressesList;
  final AddressModel? defaultAddress;
  final int addressID;

  AddressLoaded({
    required this.addressesList,
    required this.addressID,
    required this.defaultAddress,
  });
}

final class AddressEmpty extends AddressState {}

final class AddressError extends AddressState {}
