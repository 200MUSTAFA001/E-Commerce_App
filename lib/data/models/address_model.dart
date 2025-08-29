class AddressModel {
  final int? addressID;
  final String name;
  final String mobileNumber;
  final String streetDetails;
  final String landMark;
  final String state;
  final String cityDistrict;
  final String pinCode;
  final AddressType addressType;
  bool defaultAddress;

  AddressModel({
    this.addressID,
    required this.name,
    required this.mobileNumber,
    required this.streetDetails,
    required this.landMark,
    required this.state,
    required this.cityDistrict,
    required this.pinCode,
    required this.addressType,
    this.defaultAddress = false,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        addressID: json["addressID"],
        name: json["name"],
        mobileNumber: json["mobileNumber"],
        streetDetails: json["streetDetails"],
        landMark: json["landMark"],
        state: json["state"],
        cityDistrict: json["city_district"],
        pinCode: json["pinCode"],
        addressType: AddressType.values
            .firstWhere((element) => element.name == json["addressType"]),
        defaultAddress: json["defaultAddress"],
      );

  Map<String, dynamic> toJson() => {
        "addressID": addressID,
        "name": name,
        "mobileNumber": mobileNumber,
        "streetDetails": streetDetails,
        "landMark": landMark,
        "state": state,
        "city_district": cityDistrict,
        "pinCode": pinCode,
        "addressType": addressType.name,
        "defaultAddress": defaultAddress,
      };

  AddressModel copyWith({
    int? addressID,
    String? name,
    String? mobileNumber,
    String? streetDetails,
    String? landMark,
    String? state,
    String? cityDistrict,
    String? pinCode,
    AddressType? addressType,
    bool? defaultAddress,
  }) =>
      AddressModel(
        addressID: addressID ?? this.addressID,
        name: name ?? this.name,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        streetDetails: streetDetails ?? this.streetDetails,
        landMark: landMark ?? this.landMark,
        state: state ?? this.state,
        cityDistrict: cityDistrict ?? this.cityDistrict,
        pinCode: pinCode ?? this.pinCode,
        addressType: addressType ?? this.addressType,
        defaultAddress: defaultAddress ?? this.defaultAddress,
      );
}

enum AddressType { home, office, other }
