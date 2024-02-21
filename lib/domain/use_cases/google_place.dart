import '../entities/google_place.dart';

class GooglePlaceUseCase extends GooglePlaceEntity {
  const GooglePlaceUseCase({
    super.route,
    super.city,
    super.state,
    super.streetNumber,
    super.zip,
    super.fullAddress,
  });

  @override
  GooglePlaceEntity copyWith({
    final String? streetNumber,
    final String? route,
    final String? city,
    final String? state,
    final String? zip,
    final String? fullAddress,
  }) {
    return GooglePlaceUseCase(
      streetNumber: streetNumber ?? super.streetNumber,
      route: route ?? super.route,
      city: city ?? super.city,
      state: state ?? super.state,
      zip: zip ?? super.zip,
      fullAddress: fullAddress ?? super.fullAddress,
    );
  }
}
