import 'country.dart';

abstract class CountriesEntity {
  const CountriesEntity({
    this.countries,
  });

  final List<CountryEntity>? countries;

  CountriesEntity copyWith({
    final List<CountryEntity>? countries,
  });
}
