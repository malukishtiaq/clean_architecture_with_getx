import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:get/get.dart';

import '../../domain/entities/google_place.dart';
import '../../domain/use_cases/google_place.dart';
import '../constants/keys/google_place.dart';

class GooglePlacesService extends GetxController {
  factory GooglePlacesService() {
    if (Get.isRegistered<GooglePlacesService>()) {
      return Get.find<GooglePlacesService>();
    } else {
      return Get.put(GooglePlacesService._());
    }
  }

  GooglePlacesService._();

  FlutterGooglePlacesSdk get googlePlace => FlutterGooglePlacesSdk(
        googleApiKey,
      );

  Future<List<AutocompletePrediction>> findAutocompletePrediction(
    String value,
  ) async {
    if (value.isEmpty) {
      return [];
    }

    final response = await googlePlace.findAutocompletePredictions(value);
    return response.predictions;
  }

  Future<GooglePlaceEntity?> selectAddress({
    required String placeId,
  }) async {
    GooglePlaceEntity? response;

    try {
      final details = await googlePlace
          .fetchPlace(placeId, fields: [PlaceField.AddressComponents]);

      final components = details.place?.addressComponents;

      final streetNumber = _getAddressPart(components, 'street_number')?.name;
      final country = _getAddressPart(components, 'country')?.shortName;

      final route = _getAddressPart(components, 'route')?.name;
      final city = _getAddressPart(components, 'locality')?.name ??
          _getAddressPart(components, 'sublocality_level_1')?.name ??
          _getAddressPart(components, 'administrative_area_level_2')?.name;
      final state =
          _getAddressPart(components, 'administrative_area_level_1')?.shortName;
      final zip = _getAddressPart(components, 'postal_code')?.name;

      final String fullAddress =
          '$streetNumber $route, $city, $state $zip, $country';

      if (route != null && city != null && state != null && zip != null) {
        response = GooglePlaceUseCase(
          streetNumber: streetNumber,
          route: route,
          city: city,
          state: state,
          zip: zip,
          fullAddress: fullAddress,
        );
      }
    } catch (err) {
      print('Error Select address (google places)');
    }

    return response;
  }

  AddressComponent? _getAddressPart(
    List<AddressComponent>? addressComponents,
    String type,
  ) =>
      addressComponents
          ?.firstWhereOrNull((element) => element.types.first == type);
}
