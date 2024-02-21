import '../entities/countries.dart';
import '../entities/country.dart';
import 'country.dart';

class CountriesUseCase extends CountriesEntity {
  const CountriesUseCase({
    super.countries,
  });

  factory CountriesUseCase.fromJson(Map<String, dynamic> json) {
    final _allCountries = (json['Response'] as List<dynamic>)
        .map(
          (country) => CountryUseCase.fromJson(country as Map<String, dynamic>),
        )
        .toList();

    return CountriesUseCase(countries: _allCountries);
  }

  @override
  CountriesEntity copyWith({
    final List<CountryEntity>? countries,
  }) {
    return CountriesUseCase(
      countries: countries ?? super.countries,
    );
  }
}
