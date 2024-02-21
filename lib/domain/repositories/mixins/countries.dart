import 'package:get/get.dart';
import '../../entities/countries.dart';
import '../countries.dart';

mixin CountriesMixin {
  final _countriesRepository = CountriesRepository();

  Rx<CountriesEntity> get countriesObs => _countriesRepository.countriesObs;

  Future<void> Function({
    String? searchString,
  }) get getCountriesList => _countriesRepository.getCountries;
}
