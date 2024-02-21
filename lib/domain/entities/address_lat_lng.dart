abstract class AddressLatLngEntity {
  const AddressLatLngEntity({
    this.lat,
    this.lng,
  });

  final double? lat;
  final double? lng;

  AddressLatLngEntity copyWith({
    final double? lat,
    final double? lng,
  });
}
