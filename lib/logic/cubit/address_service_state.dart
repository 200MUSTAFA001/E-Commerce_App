part of 'address_service_cubit.dart';

@immutable
sealed class AddressServiceState {}

final class AddressServiceInitial extends AddressServiceState {}

final class AddressServiceLoading extends AddressServiceState {}

final class AddressServiceLoaded extends AddressServiceState {
  final List<AddressResultModel> addressesList;

  AddressServiceLoaded({required this.addressesList});
}
