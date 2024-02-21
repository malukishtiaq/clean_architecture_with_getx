import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../domain/use_cases/address_lat_lng.dart';
import '../constants/keys/google_place.dart';

class GoogleApiPlacemarkFromCoordinatesServices {
  getPlacemarkFromCoordinates(latitude, longitude) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$googleApiKey',
    );
    try {
      final response = await http.get(url);
      final responseDecoded = json.decode(response.body);
      final componentsDynamic =
          responseDecoded['results'][0]['address_components'];
      final components = List<AddressComponent>.from(
        componentsDynamic.map((component) {
          final longName = component['long_name'];
          final shortName = component['short_name'];
          final types = List<String>.from(component['types']);

          return AddressComponent(
            name: longName,
            shortName: shortName,
            types: types,
          );
        }),
      );

      final streetNumber =
          _getAddressPart(components, 'street_number')?.name ?? '';
      final route = _getAddressPart(components, 'route')?.name ?? '';
      final city = _getAddressPart(components, 'locality')?.name ??
          _getAddressPart(components, 'sublocality_level_1')?.name ??
          _getAddressPart(components, 'administrative_area_level_2')?.name;
      final state =
          _getAddressPart(components, 'administrative_area_level_1')?.shortName;
      final zip = _getAddressPart(components, 'postal_code')?.name;

      final Placemark selectedLocation = Placemark(
        street: '$streetNumber $route',
        locality: city,
        administrativeArea: state,
        postalCode: zip,
      );
      return selectedLocation;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getCountryShortNameFromCoordinates(latitude, longitude) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$googleApiKey',
    );
    try {
      final response = await http.get(url);
      final responseDecoded = json.decode(response.body);
      final componentsDynamic =
          responseDecoded['results'][0]['address_components'];
      final components = List<AddressComponent>.from(
        componentsDynamic.map((component) {
          final longName = component['long_name'];
          final shortName = component['short_name'];
          final types = List<String>.from(component['types']);

          return AddressComponent(
            name: longName,
            shortName: shortName,
            types: types,
          );
        }),
      );

      final String selectCountryShortName = components
          .firstWhere((element) => element.types.contains('country'))
          .shortName;

      return selectCountryShortName;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<AddressLatLngUseCase?> getCoordinatesFromAddress(
    String fullAddress,
  ) async {
    final encodedAddress = Uri.encodeQueryComponent(fullAddress);
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?address=$encodedAddress&key=$googleApiKey',
    );
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        final results = data['results'] as List<dynamic>;
        if (results.isNotEmpty) {
          final location = results[0]['geometry']['location'];
          final lat = location['lat'];
          final lng = location['lng'];
          return AddressLatLngUseCase(lat: lat, lng: lng);
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  AddressComponent? _getAddressPart(
    List<AddressComponent>? addressComponents,
    String type,
  ) =>
      addressComponents
          ?.firstWhereOrNull((element) => element.types.first == type);
}
