abstract class GooglePlaceEntity {
  const GooglePlaceEntity({
    this.streetNumber,
    this.route,
    this.city,
    this.state,
    this.zip,
    this.fullAddress,
  });

  final String? streetNumber;
  final String? route;
  final String? city;
  final String? state;
  final String? zip;
  final String? fullAddress;

  GooglePlaceEntity copyWith({
    final String? streetNumber,
    final String? route,
    final String? city,
    final String? state,
    final String? zip,
    final String? fullAddress,
  });
}
