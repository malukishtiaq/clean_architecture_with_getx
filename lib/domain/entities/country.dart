abstract class CountryEntity {
  const CountryEntity({
    this.recordCount,
    this.id,
    this.countryName,
    this.countryCode,
    this.flag,
    this.flagPng,
    this.flagSvg,
    this.latitude,
    this.longitude,
    this.timeZone,
  });

  final int? recordCount;
  final int? id;
  final String? countryName;
  final String? countryCode;
  final String? flag;
  final String? flagPng;
  final String? flagSvg;
  final double? latitude;
  final double? longitude;
  final String? timeZone;

  CountryEntity copyWith({
    final int? recordCount,
    final int? id,
    final String? countryName,
    final String? countryCode,
    final String? flag,
    final String? flagPng,
    final String? flagSvg,
    final double? latitude,
    final double? longitude,
    final String? timeZone,
  });
}
