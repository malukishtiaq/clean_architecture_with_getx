import '../entities/address_lat_lng.dart';

class AddressLatLngUseCase extends AddressLatLngEntity {
  const AddressLatLngUseCase({
    super.lat,
    super.lng,
  });

  @override
  AddressLatLngEntity copyWith({
    final double? lat,
    final double? lng,
  }) {
    return AddressLatLngUseCase(
      lat: lat ?? super.lat,
      lng: lng ?? super.lng,
    );
  }
}
