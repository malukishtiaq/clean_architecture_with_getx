import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../app/services/current_location.dart';

mixin CurrentLocationMixin {
  final CurrentLocationService _currentLocationService =
      CurrentLocationService();

  Rx<CountryWithPhoneCode> get currentCountryWithPhoneCodeObs =>
      _currentLocationService.currentCountryWithPhoneCodeObs;

  Future<void> Function() get getCurrentCountry =>
      _currentLocationService.getCurrentCountry;

  Future<CountryWithPhoneCode> Function(double lat, double lng)
      get getCountryFromCoordinates =>
          _currentLocationService.getCountryFromCoordinates;

  Future<Position> Function() get getCurrentLocation =>
      _currentLocationService.getCurrentLocation;
}
