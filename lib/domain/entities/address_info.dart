abstract class AddressInfoEntity {
  const AddressInfoEntity({
    this.id,
    this.isDeleted,
    this.changedOn,
    this.tokensIdChangedBy,
    this.location,
    this.street,
    this.appOrSuite,
    this.city,
    this.state,
    this.zipCode,
    this.longitude,
    this.latitude,
  });

  final int? id;
  final bool? isDeleted;
  final String? changedOn;
  final int? tokensIdChangedBy;
  final String? location;
  final String? street;
  final String? appOrSuite;
  final String? city;
  final String? state;
  final String? zipCode;
  final double? longitude;
  final double? latitude;

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
  });
}
