import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/country.dart';

class CountryUseCase extends CountryEntity {
  CountryUseCase({
    super.recordCount,
    super.id,
    super.countryName,
    super.countryCode,
    super.flag,
    super.flagPng,
    super.flagSvg,
    super.latitude,
    super.longitude,
    super.timeZone,
  });

  factory CountryUseCase.fromJson(Map<String, dynamic> json) => CountryUseCase(
        recordCount: ParseFromDynamic.toInt(input: json['RecordCount']),
        id: ParseFromDynamic.toInt(input: json['Id']),
        countryName: ParseFromDynamic.parseToString(input: json['CountryName']),
        countryCode: ParseFromDynamic.parseToString(input: json['CountryCode']),
        flag: ParseFromDynamic.parseToString(input: json['Flag']),
        flagPng: ParseFromDynamic.parseToString(input: json['FlagPng']),
        flagSvg: ParseFromDynamic.parseToString(input: json['FlagSvg']),
        latitude: ParseFromDynamic.toDouble(input: json['Latitude']),
        longitude: ParseFromDynamic.toDouble(input: json['Longitude']),
        timeZone: ParseFromDynamic.parseToString(input: json['CountryCode']),
      );

  @override
  CountryUseCase copyWith({
    int? recordCount,
    int? id,
    String? countryName,
    String? countryCode,
    String? flag,
    String? flagPng,
    String? flagSvg,
    double? latitude,
    double? longitude,
    String? timeZone,
  }) =>
      CountryUseCase(
        recordCount: recordCount ?? this.recordCount,
        id: id ?? this.id,
        countryName: countryName ?? this.countryName,
        countryCode: countryCode ?? this.countryCode,
        flag: flag ?? this.flag,
        flagPng: flagPng ?? this.flagPng,
        flagSvg: flagSvg ?? this.flagSvg,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        timeZone: timeZone ?? this.timeZone,
      );
}
