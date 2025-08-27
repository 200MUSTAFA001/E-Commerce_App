part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoaded extends AddressState {
  final List<AddressModel> userAddressesList;
  final int addressID;

  AddressLoaded({required this.userAddressesList, required this.addressID});
}

final class AddressEmpty extends AddressState {}

final class AddressError extends AddressState {}
