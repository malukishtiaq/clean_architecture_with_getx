import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'google_api_pfc_services.dart';

class CurrentLocationService extends GetxController {
  factory CurrentLocationService() {
    if (Get.isRegistered<CurrentLocationService>()) {
      return Get.find<CurrentLocationService>();
    } else {
      return Get.put(CurrentLocationService._());
    }
  }

  CurrentLocationService._();

  Rx<CountryWithPhoneCode> currentCountryWithPhoneCodeObs =
      const CountryWithPhoneCode.us().obs;

  final googleApiPlacemarkService = GoogleApiPlacemarkFromCoordinatesServices();
  CountryWithPhoneCode currentSelectedCountry = const CountryWithPhoneCode.us();

  Future<void> getCurrentCountry() async {
    try {
      final currentPositionToSet = await getCurrentLocation();

      final String? selectedLocationPlacemark =
          await googleApiPlacemarkService.getCountryShortNameFromCoordinates(
        currentPositionToSet.latitude,
        currentPositionToSet.longitude,
      );

      if (selectedLocationPlacemark != null) {
        await init();
        final Map<String, CountryWithPhoneCode> allCountries =
            await getAllSupportedRegions();
        final CountryWithPhoneCode country = allCountries.entries
            .firstWhere(
              (entry) =>
                  entry.key.toLowerCase() ==
                  selectedLocationPlacemark.toLowerCase(),
            )
            .value;

        currentSelectedCountry = country;
        currentCountryWithPhoneCodeObs.value = currentSelectedCountry;
      } else {
        currentCountryWithPhoneCodeObs.value = const CountryWithPhoneCode.us();
      }
    } catch (e) {
      currentCountryWithPhoneCodeObs.value = const CountryWithPhoneCode.us();
    }
  }

  Future<CountryWithPhoneCode> getCountryFromCoordinates(
    double lat,
    double lng,
  ) async {
    try {
      final String? selectedLocationPlacemark =
          await googleApiPlacemarkService.getCountryShortNameFromCoordinates(
        lat,
        lng,
      );

      if (selectedLocationPlacemark != null) {
        await init();
        final Map<String, CountryWithPhoneCode> allCountries =
            await getAllSupportedRegions();
        final CountryWithPhoneCode country = allCountries.entries
            .firstWhere(
              (entry) =>
                  entry.key.toLowerCase() ==
                  selectedLocationPlacemark.toLowerCase(),
            )
            .value;

        currentSelectedCountry = country;
        return currentSelectedCountry;
      } else {
        return const CountryWithPhoneCode.us();
      }
    } catch (e) {
      return const CountryWithPhoneCode.us();
    }
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are desabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanetly denied');
    }
    final currentLocation = await Geolocator.getCurrentPosition();
    return currentLocation;
  }
}
