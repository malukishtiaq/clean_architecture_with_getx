import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/address_info.dart';

class AddressInfoUseCase extends AddressInfoEntity {
  const AddressInfoUseCase({
    super.id,
    super.isDeleted,
    super.changedOn,
    super.tokensIdChangedBy,
    super.location,
    super.street,
    super.appOrSuite,
    super.city,
    super.state,
    super.zipCode,
    super.longitude,
    super.latitude,
  });

  factory AddressInfoUseCase.fromJson(Map<String, dynamic> json) {
    return AddressInfoUseCase(
      id: ParseFromDynamic.toInt(input: json['Id']),
      isDeleted: ParseFromDynamic.toBool(input: json['Isdeleted']),
      changedOn: ParseFromDynamic.parseToString(input: json['Changedon']) ?? '',
      tokensIdChangedBy:
          ParseFromDynamic.toInt(input: json['TokensId_Changedby']),
      location: ParseFromDynamic.parseToString(input: json['Location']),
      street: ParseFromDynamic.parseToString(input: json['Street']),
      appOrSuite: ParseFromDynamic.parseToString(input: json['Apporsuite']),
      city: ParseFromDynamic.parseToString(input: json['City']),
      state: ParseFromDynamic.parseToString(input: json['State']),
      zipCode: ParseFromDynamic.parseToString(input: json['Zipcode']),
      longitude: ParseFromDynamic.toDouble(input: json['Longitude']),
      latitude: ParseFromDynamic.toDouble(input: json['Latitude']),
    );
  }

  @override
  AddressInfoEntity copyWith({
    final int? id,
    final bool? isDeleted,
    final String? changedOn,
    final int? tokensIdChangedBy,
    final String? location,
    final String? street,
    final String? appOrSuite,
    final String? city,
    final String? state,
    final String? zipCode,
    final double? longitude,
    final double? latitude,
  }) {
    return AddressInfoUseCase(
      id: id ?? this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      changedOn: changedOn ?? this.changedOn,
      tokensIdChangedBy: tokensIdChangedBy ?? this.tokensIdChangedBy,
      location: location ?? this.location,
      street: street ?? this.street,
      appOrSuite: appOrSuite ?? this.appOrSuite,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }
}
